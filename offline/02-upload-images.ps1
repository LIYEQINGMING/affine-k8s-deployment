# Image Upload Script (PowerShell)

# -----------------------------------------------------------------------------
# CONFIGURATION
# -----------------------------------------------------------------------------
# Set your target Harbor registry URL here (e.g., harbor.internal.com/project-name)
$TargetRegistry = "harbor.internal.com/affine"
# -----------------------------------------------------------------------------

$Images = @(
    @{ Original="ghcr.io/toeverything/affine:stable"; TargetName="affine"; Tag="stable" },
    @{ Original="pgvector/pgvector:pg16"; TargetName="pgvector"; Tag="pg16" },
    @{ Original="redis:latest"; TargetName="redis"; Tag="latest" },
    @{ Original="prom/prometheus:latest"; TargetName="prometheus"; Tag="latest" },
    @{ Original="busybox:latest"; TargetName="busybox"; Tag="latest" }
)

# Check if saved-images directory exists
$SaveDir = "saved-images"
if (-not (Test-Path $SaveDir)) {
    Write-Error "Directory '$SaveDir' not found. Please run 01-download-images.ps1 first or copy the directory here."
    exit 1
}

# Extract registry host
$RegistryHost = $TargetRegistry.Split("/")[0]

Write-Host "Checking registry login for: $RegistryHost"
# Attempt to login (will prompt if not logged in or use existing credentials)
docker login $Regist
ryHost

if ($LASTEXITCODE -ne 0) {
    Write-Error "Docker login failed. Please check your credentials and try again."
    exit 1
}

foreach ($Img in $Images) {
    $OriginalImage = $Img.Original
    Write-Host "Processing image: $OriginalImage"
    
    # 1. Load the image from tar file
    $ImageNameFile = $OriginalImage -replace '[:/]', '_'
    $LoadPath = Join-Path $SaveDir "$ImageNameFile.tar"
    
    if (Test-Path $LoadPath) {
        Write-Host "  Loading from $LoadPath..."
        docker load -i $LoadPath
    } else {
        Write-Warning "  Image file $LoadPath not found, trying to use local image cache."
    }
    
    # 2. Tag the image for the target registry
    $NewImageTag = "$TargetRegistry/$($Img.TargetName):$($Img.Tag)"
    
    Write-Host "  Tagging $OriginalImage as $NewImageTag..."
    docker tag $OriginalImage $NewImageTag
    
    # 3. Push the image
    Write-Host "  Pushing to Harbor..."
    docker push $NewImageTag
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to push image: $NewImageTag"
        exit 1
    }
    
    Write-Host "  Done."
}

Write-Host "All images uploaded to Harbor."
Write-Host "Please update your Kubernetes YAML files to use the new image registry: $TargetRegistry"
