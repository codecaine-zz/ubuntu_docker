#!/bin/bash

CONTAINER_NAME="ubuntu"
HOST_DATA_DIR="$HOME/ubuntu-data"

# Check if container exists by name
if docker ps -aq --filter "name=^${CONTAINER_NAME}$" | grep -q .; then
    # Container exists, check if running
    if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME")" = "true" ]; then
        echo "Container already running. Attaching..."
        docker attach "$CONTAINER_NAME"
    else
        echo "Restarting stopped container..."
        docker start -ai "$CONTAINER_NAME"
    fi
else
    echo "Container not found. Creating new one..."
    mkdir -p "$HOST_DATA_DIR"
    docker run --name "$CONTAINER_NAME" \
        -v "$HOST_DATA_DIR:/data" \
        -it ubuntu:latest bash
fi
ls