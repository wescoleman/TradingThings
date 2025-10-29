This folder contains a minimal Dockerfile that builds an Ubuntu-based image using the `ubuntu:24.04` official image.

Build the image (run in the project root or from this folder):

```bash
# Build with default user ('app_user')
docker build -t trading-things:v0.1.0 ./docker

Run an interactive container:

```bash
docker run --rm -it trading-things:v0.1.0
```

Run with current directory mounted into the container (useful for development):

```bash
docker run --rm -it -v "$(pwd)":/home/dev -p 8080:80 trading-things:v0.1.0
```

Notes and recommendations:
- The Dockerfile creates a non-root user (default name 'dev' with UID 1000). Set the `CONTAINER_USER` environment variable to customize the username (e.g., `CONTAINER_USER=yourusername`).
- To add your app, use `COPY` and `RUN` instructions before `USER` if root privileges are required for setup.
- Keep images small by avoiding unnecessary packages and cleaning apt caches (the Dockerfile already removes `/var/lib/apt/lists/*`).

VS Code Development Container Setup:

Option 1 - Using the setup script (recommended):
1. Run the setup script:
   ```bash
   ./setup-devcontainer.sh
   ```
2. Enter your preferred username when prompted
3. Open VS Code and select "Dev Containers: Rebuild and Reopen in Container"

Option 2 - Manual setup:
1. Rename `.devcontainer/devcontainertmp.json` to `.devcontainer/devcontainer.json`
2. Edit the new `devcontainer.json`:
   - Change `"CONTAINER_USER": "dev"` to your preferred username
   - Update `remoteUser` to match your username
   - Update `workspaceFolder` path to `/home/your-username`
   - Update `mounts` target path to `/home/your-username`
3. Open the Command Palette (Ctrl+Shift+P) and select "Dev Containers: Rebuild and Reopen in Container"
