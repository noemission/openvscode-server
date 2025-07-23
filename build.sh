#! /bin/bash

docker build --no-cache -f build.Dockerfile \
	--platform=linux/amd64 \
	--output=final-binaries \
	--progress plain \
	--build-arg TARGETOS=linux \
	--build-arg TARGETARCH=x64 .
