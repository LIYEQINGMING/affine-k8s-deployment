# Generate Kubernetes YAMLs with updated image registry (PowerShell)

# -----------------------------------------------------------------------------
# CONFIGURATION
# -----------------------------------------------------------------------------
# Set your target Harbor registry URL here (e.g., harbor.internal.com/project-name)
$TargetRegistry = "harbor.internal.com/affine"
# -----------------------------------------------------------------------------

# Path to original k8s manifests
$K8sDir = "..\k8s"
$OutputDir = "..\k8s-offline"

# Ensure output directory exists
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

# Get all YAML files
$YamlFiles = Get-ChildItem -Path $K8sDir -Filter "*.yaml"

foreach ($File in $YamlFiles) {
    $Content = Get-Content -Path $File.FullName -Raw
    
    # Replace image references
    # Note: This is a simple string replacement. 
    
    # 1. Affine
    $Content = $Content -replace "ghcr.io/toeverything/affine:stable", "$TargetRegistry/affine:stable"
    
    # 2. Postgres (pgvector)
    $Content = $Content -replace "pgvector/pgvector:pg16", "$TargetRegistry/pgvector:pg16"
    
    # 3. Redis
    # Be careful not to replace 'redis' service names, only image: redis:latest
    $Content = $Content -replace "image: redis:latest", "image: $TargetRegistry/redis:latest"
    
    # 4. Prometheus
    $Content = $Content -replace "prom/prometheus:latest", "$TargetRegistry/prometheus:latest"
    
    $OutputPath = Join-Path -Path $OutputDir -ChildPath $File.Name
    Set-Content -Path $OutputPath -Value $Content
    Write-Host "Generated $OutputPath"
}

Write-Host "Offline Kubernetes manifests generated in $OutputDir"
Write-Host "You can now apply these manifests using: kubectl apply -f $OutputDir"
