# PowerShell script for deploying Open Source Casino to Docker
# Run this script in PowerShell as Administrator

Write-Host "🎰 Open Source Casino Docker Deployment Script" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green

# Check if Docker is installed
try {
    docker --version | Out-Null
    Write-Host "✓ Docker is installed" -ForegroundColor Green
} catch {
    Write-Host "✗ Docker is not installed or not running" -ForegroundColor Red
    Write-Host "Please install Docker Desktop from https://www.docker.com/products/docker-desktop/" -ForegroundColor Yellow
    exit 1
}

# Check if Docker Compose is available
try {
    docker-compose --version | Out-Null
    Write-Host "✓ Docker Compose is available" -ForegroundColor Green
} catch {
    Write-Host "✗ Docker Compose is not available" -ForegroundColor Red
    exit 1
}

Write-Host "`nStarting deployment..." -ForegroundColor Cyan

# Build and start the application
Write-Host "Building and starting the application..." -ForegroundColor Yellow
docker-compose up -d --build

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n🎉 Deployment successful!" -ForegroundColor Green
    Write-Host "Your Open Source Casino is now running at: http://localhost:8080" -ForegroundColor Cyan
    Write-Host "`nUseful commands:" -ForegroundColor Yellow
    Write-Host "- View logs: docker-compose logs -f" -ForegroundColor White
    Write-Host "- Stop application: docker-compose down" -ForegroundColor White
    Write-Host "- Restart application: docker-compose restart" -ForegroundColor White
} else {
    Write-Host "`n❌ Deployment failed!" -ForegroundColor Red
    Write-Host "Check the error messages above for troubleshooting." -ForegroundColor Yellow
}

Write-Host "`nPress any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
