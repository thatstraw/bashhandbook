#!/usr/bin/env sh
# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# The directory where the book source is located
BOOK_SOURCE_DIR=book
# The directory where the book's generated output files will be created
BOOK_BUILD_DIR=build

# Use a custom Docker image with pygments.rb and Python installed
DOCKER_IMAGE=custom-asciidoctor-pdf:pygments

docker build -t $DOCKER_IMAGE -f Dockerfile.asciidoctor-pdf .

docker run --rm -w /documents -v $(pwd):/documents/ $DOCKER_IMAGE asciidoctor-epub3 \
    -D $BOOK_BUILD_DIR \
    $BOOK_SOURCE_DIR/index.adoc
