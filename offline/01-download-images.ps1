# Image Download Script (PowerShell)

$Images = @(
    "ghcr.io/toeverything/affine:stable",
    "pgvector/pgvector:pg16",
    "redis:latest",
    "prom/prometheus:latest",
    "busybox:latest"
)

# Check if docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "Docker is not installed or not in PATH."
    exit 1
}

# Create a directory for saved images if it doesn't exist
$SaveDir = "saved-images"
if (-not (Test-Path $SaveDir)) {
    New-Item -ItemType Directory -Force -Path $SaveDir | Out-Null
}

foreach ($Image in $Images) {
    Write-Host "Processing image: $Image"
    
    # 1. Pull the image
    Write-Host "  Pulling..."
    docker pull $Image
    
    # 2. Save the image to a tar file
    # Replace invalid characters in filename
    $ImageName = $Image -replace '[:/]', '_'
    $SavePath = Join-Path $SaveDir "$ImageName.tar"
    
    Write-Host "  Saving to $SavePath..."
    docker save -o $SavePath $Image
    
    Write-Host "  Done."
}

Write-Host "All images downloaded and saved to '$SaveDir' directory."
