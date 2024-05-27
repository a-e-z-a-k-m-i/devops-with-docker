#!/bin/bash

if [ -z "$GITHUB_URL" ] || [ -z "$DOCKER_HUB_REPOSITORY" ] || [ -z "$DOCKER_HUB_USER" ] || [ -z "$DOCKER_HUB_TOKEN" ]; then
    echo "Error: undefined environment variable(s)"
    exit -1
fi

if [ $(curl -s -o /dev/null -w "%{http_code}" -I "https://hub.docker.com/v2/repositories/$DOCKER_HUB_USER/$DOCKER_HUB_REPOSITORY/tags/") -eq 200 ]; then
    echo "Error: Docker Hub repository already exists"
    exit -1
fi

if ! echo "$DOCKER_HUB_TOKEN" | docker login --username "$DOCKER_HUB_USER" --password-stdin &> /dev/null; then
    echo "Error: unauthorized Docker Hub access"
    exit -1
fi

set -e
git clone "$GITHUB_URL"
cd $(basename "$GITHUB_URL" .git)
docker build . -t "$DOCKER_HUB_USER/$DOCKER_HUB_REPOSITORY"
docker push "$DOCKER_HUB_USER/$DOCKER_HUB_REPOSITORY"
docker rmi "$DOCKER_HUB_USER/$DOCKER_HUB_REPOSITORY"