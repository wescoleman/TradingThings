@echo off
REM Setup script for development container in Windows

echo Setting up development container...

REM Check if Docker is running
docker info > nul 2>&1
if errorlevel 1 (
    echo Error: Docker is not running.
    echo Please start Docker Desktop and try again.
    exit /b 1
)

REM Get current username
set /p CONTAINER_USER=Enter username for container (default: %USERNAME%): 
if "%CONTAINER_USER%"=="" set CONTAINER_USER=%USERNAME%

REM Update devcontainer.json with the username
echo Configuring development container for user: %CONTAINER_USER%
(
echo {
echo     "name": "Development Container",
echo     "build": {
echo         "dockerfile": "../docker/Dockerfile",
echo         "context": ".."
echo     },
echo     "remoteUser": "%CONTAINER_USER%",
echo     "customizations": {
echo         "vscode": {
echo             "extensions": [
echo                 "ms-vscode-remote.remote-containers"
echo             ]
echo         }
echo     }
echo }
) > ..\.devcontainer\devcontainer.json

echo Setup complete! 
echo Please open VS Code and use "Dev Containers: Rebuild and Reopen in Container"