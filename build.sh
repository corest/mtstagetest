#!/bin/sh
echo Building corest/mtstagetest:build

docker build -t corest/mtstagetest:build . -f Dockerfile.build

docker create --name extract corest/mtstagetest:build
docker cp extract:/go/src/github.com/corest/mtstagetest/app ./app
docker rm -f extract

echo Building corest/mtstagetest:latest

docker build --no-cache -t corest/mtstagetest:latest .