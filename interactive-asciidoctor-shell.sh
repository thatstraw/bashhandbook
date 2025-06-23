#!/usr/bin/env sh
# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# Use a custom Docker image with pygments.rb and Python installed
DOCKER_IMAGE=custom-asciidoctor-pdf:pygments

docker build -t $DOCKER_IMAGE -f Dockerfile.asciidoctor-pdf .

docker run -it -w /documents -v $(pwd)/book:/documents/ $DOCKER_IMAGE sh