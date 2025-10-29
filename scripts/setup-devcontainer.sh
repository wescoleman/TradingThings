#!/bin/bash

# Script to set up VS Code devcontainer configuration
echo "Setting up your VS Code Development Container configuration..."

# Get the user's preferred container username
read -p "Enter your preferred container username (e.g., jane, dev123): " container_user

if [ -z "$container_user" ]; then
    echo "Error: Username cannot be empty"
    exit 1
fi

# Check if devcontainer.json already exists
if [ -f .devcontainer/devcontainer.json ]; then
    read -p ".devcontainer/devcontainer.json already exists. Overwrite? (y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "Setup cancelled"
        exit 0
    fi
fi

# Check if template exists
if [ ! -f .devcontainer/devcontainertmp.json ]; then
    echo "Error: Template file .devcontainer/devcontainertmp.json not found"
    exit 1
fi

# Create devcontainer.json from template, replacing the username
sed "s/\"dev\"/\"$container_user\"/g" .devcontainer/devcontainertmp.json > .devcontainer/devcontainer.json.tmp

# Replace all /home/dev paths with the user's path
sed "s|/home/dev|/home/$container_user|g" .devcontainer/devcontainer.json.tmp > .devcontainer/devcontainer.json
rm .devcontainer/devcontainer.json.tmp

echo "✅ Created .devcontainer/devcontainer.json with username: $container_user"
echo
echo "Next steps:"
echo "1. Open VS Code in this directory (if not already open)"
echo "2. Press Ctrl+Shift+P and select 'Dev Containers: Rebuild and Reopen in Container'"
echo
echo "Your development container will be built with user: $container_user"