# ubuntu_start.sh

This repository contains a small helper script, `ubuntu_start.sh`, that manages a Docker container named `ubuntu`.

## What it does

- Checks whether a Docker container named `ubuntu` already exists.
- If the container exists and is running, it attaches to the container.
- If the container exists but is stopped, it restarts the container and attaches to it.
- If the container does not exist, it creates a new one using the `ubuntu:latest` image and starts an interactive Bash shell.
- Mounts a host directory at `$HOME/ubuntu-data` into the container at `/data`.
- After container setup, it runs `ls` on the host machine.

## Usage

1. Make the script executable if needed:

```bash
chmod +x ubuntu_start.sh
```

1. For global access, move the script to `/usr/local/bin`:

```bash
sudo mv ubuntu_start.sh /usr/local/bin/ubuntu_start
```

1. Run the script from anywhere:

```bash
ubuntu_start
```

## Requirements

- Docker must be installed and configured on the host machine.
- The user must have permission to run Docker commands.

## Notes

- The script uses a fixed container name: `ubuntu`.
- The host directory `~/ubuntu-data` is created automatically if it does not exist.
- The script launches the container with an interactive terminal using `bash`.
