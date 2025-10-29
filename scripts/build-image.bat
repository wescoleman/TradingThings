@echo off
REM Build script for Docker image in Windows

set TAG=%1
if "%TAG%"=="" set TAG=latest

echo Building Docker image with tag: %TAG%

REM Check if Docker is running
docker info > nul 2>&1
if errorlevel 1 (
    echo Error: Docker is not running.
    echo Please start Docker Desktop and try again.
    exit /b 1
)

REM Build the image
docker build -t trading-things:%TAG% -f docker/Dockerfile .
if errorlevel 1 (
    echo Error: Failed to build Docker image.
    exit /b 1
)

echo Build complete! Image tagged as trading-things:%TAG%