#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: invalid arguments"
    exit -1
fi

if ! command -v git &> /dev/null; then
    echo "Error: git is required to clone the repository"
    exit -1
fi

if ! command -v docker &> /dev/null; then
    echo "Error: docker is required to build and push your image"
    exit -1
fi

if ! docker info | grep -qi 'username'; then
    echo "Error: unauthorized Docker Hub access"
    exit -1
fi

DOCKER_HUB_USER=$(docker info | grep -i 'username' | awk '{print $2}')
DOCKER_HUB_REPO=$2

if [ $(curl -s -o /dev/null -w "%{http_code}" -I "https://hub.docker.com/v2/repositories/$DOCKER_HUB_USER/$DOCKER_HUB_REPO/tags/") -eq 200 ]; then
    echo "Error: Docker Hub repository already exists"
    exit -1
fi

set -e
git clone "$1" --quiet
cd $(basename "$1" .git)
docker build . -t "$DOCKER_HUB_USER/$DOCKER_HUB_REPO" &> /dev/null
docker push "$DOCKER_HUB_USER/$DOCKER_HUB_REPO" --quiet