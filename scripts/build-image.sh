#!/bin/bash

# Exit on error
set -e

# Script directory (where this script lives)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Project root (one level up from scripts/)
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
# Default tag if none provided
DEFAULT_TAG="v0.1.0"

# Use first argument as tag if provided, otherwise use default
TAG=${1:-$DEFAULT_TAG}

echo "Building trading-things:$TAG..."
echo "Using Dockerfile from: $PROJECT_ROOT/docker"

# Build the image
docker build -t "trading-things:$TAG" "$PROJECT_ROOT/docker"

echo "✅ Build complete!"
echo "To run an interactive shell in the container:"
echo "docker run --rm -it trading-things:$TAG"