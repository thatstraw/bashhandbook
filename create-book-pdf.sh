#!/usr/bin/env sh
# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# The directory where the book source is located
BOOK_SOURCE_DIR=book
# The directory where the book's generated output files will be created
BOOK_BUILD_DIR=build
#     To override theme configuration file you can pass the following command-line arguments:
#
#    -a pdf-themesdir=$BOOK_SOURCE_DIR/themes \
#    -a pdf-theme=$1 \
#    -a pdf-fontsdir=$BOOK_SOURCE_DIR/fonts \

# Use a custom Docker image with pygments.rb and Python installed
DOCKER_IMAGE=custom-asciidoctor-pdf:pygments

docker build -t $DOCKER_IMAGE -f Dockerfile.asciidoctor-pdf .

docker run --rm -w /documents -v $(pwd):/documents/ $DOCKER_IMAGE asciidoctor-pdf \
    -D $BOOK_BUILD_DIR \
    -o bash-scripting-handbook.pdf \
    -r ./book/extensions/pdf-converter-admonition-theme-per-type.rb \
    --trace \
    $BOOK_SOURCE_DIR/index.adoc
