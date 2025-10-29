# Trading Things

## Quick Start

### Prerequisites
### Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [VS Code](https://code.visualstudio.com/)
- [VS Code Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- For Windows users who want to do the project setup in linux environment:
  - [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) (Windows Subsystem for Linux)
  - [Docker Desktop with WSL2 backend](https://docs.docker.com/desktop/wsl/)
- some .bat files are provided if you want to stick strictly to native windows for setup

### Development Setup

#### Windows Users
1. Open WSL2 terminal (Ubuntu recommended)
2. Navigate to your Windows drives (important for Docker Desktop integration):
```bash
cd /mnt/c/your/preferred/location
```
3. Clone the repository in WSL:
```bash
git clone https://github.com/yourusername/trading-things.git
cd trading-things
```

> **Important for Windows/WSL2**: The project must be located in the Windows file system (under `/mnt/c/` or similar) for Docker Desktop to work properly. Don't clone or move the project to the WSL file system (e.g., `/home/username/`).

#### Linux/Mac Users
1. Open terminal
2. Clone the repository:
```bash
git clone https://github.com/yourusername/trading-things.git
cd trading-things
```

#### All Users - Container Setup
Choose one setup method:

**Option A: Using VS Code (Recommended)**
- Windows: Run these commands in your WSL terminal
- Linux/Mac: Run in your regular terminal
```bash
# Make script executable
chmod +x setup-devcontainer.sh
# Run the setup script and follow the prompts
./setup-devcontainer.sh
```
   Then:
   - Open VS Code
   - Press `Ctrl+Shift+P`
   - Select "Dev Containers: Rebuild and Reopen in Container"

   **Option B: Using Docker directly**
   ```bash
   # Build the image (from project root)
   ./scripts/build-image.sh

   # Or with a custom tag (tag of the form v0.1.0)
   ./scripts/build-image.sh mytag
   ```

### Project Structure
```
.
├── docker/               # Docker configuration
│   ├── Dockerfile       # Container definition
│   ├── .dockerignore    # Files to exclude from builds
│   └── DOCKER.md        # Docker-specific documentation
├── .devcontainer/       # VS Code container configuration
├── scripts/             # Utility scripts
│   ├── *.sh            # Shell scripts for Linux/Mac/WSL
│   └── *.bat           # Batch scripts for Windows
└── README.md           # This file
```

### Windows Native Users (Without WSL)
If you prefer not to use WSL, you can use the Windows batch scripts instead:
1. Open Command Prompt
2. Run the setup script:
```cmd
scripts\setup-devcontainer.bat
```

To build the image with a custom tag:
```cmd
scripts\build-image.bat mytag
```

Note: The .bat scripts provide the same functionality as the shell scripts but are designed to work natively in Windows Command Prompt. No special permissions or execution policies are needed.

### Development Workflow

1. **First Time Setup**
   - Follow the Quick Start guide above
   - VS Code will build the container and reopen the project inside it

2. **Daily Development**
   - Open VS Code
   - Project automatically opens in the development container
   - All dependencies and tools are available in the container

3. **Rebuilding the Container**
   - When Dockerfile changes: "Dev Containers: Rebuild Container"
   - When devcontainer.json changes: "Dev Containers: Rebuild and Reopen in Container"

### Customization

1. **Container Username**
   - Run `./setup-devcontainer.sh` to set your preferred username
   - Or manually edit `.devcontainer/devcontainer.json`

2. **Container Settings**
   - See `docker/DOCKER.md` for detailed container configuration
   - Modify `Dockerfile` to add tools/dependencies

### Troubleshooting

1. **Docker Issues**
   - Ensure Docker is running
   - On WSL2: Docker Desktop must be running with WSL2 integration enabled
   - Try `docker ps` to verify Docker connection

2. **VS Code Issues**
   - Install the "Dev Containers" extension
   - Try "Dev Containers: Rebuild Container"
   - Check VS Code's Remote-Containers output panel

3. **Container User Issues**
   - Check effective user with `id` in container
   - Verify username in `.devcontainer/devcontainer.json`

### Contributing

1. Fork the repository
2. Create your feature branch
3. Set up development container as above
4. Make your changes
5. Submit a pull request
