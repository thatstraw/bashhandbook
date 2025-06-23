@echo off
REM Use a custom Docker image with pygments.rb and Python installed
SET DOCKER_IMAGE=custom-asciidoctor-pdf:pygments

docker build -t %DOCKER_IMAGE% -f Dockerfile.asciidoctor-pdf .

docker run --rm -w /documents -v %cd%:/documents/ %DOCKER_IMAGE% asciidoctor-epub3 ^
    -D build ^
    book/index.adoc