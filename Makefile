CONTAINER_TOOL := docker

_PLATFORMS ?= linux/arm64,linux/amd64
_TAG       ?= asd

.PHONY: all build buildx

all:

build:
	$(CONTAINER_TOOL) build -t $(_TAG) -f Dockerfile .

buildx: _LATEST := $(firstword $(subst :, ,$(_TAG))):latest
buildx:
	- $(CONTAINER_TOOL) buildx create --name=gaga-builder
	$(CONTAINER_TOOL) buildx use gaga-builder
	$(CONTAINER_TOOL) buildx build --push --platform=$(_PLATFORMS) -t $(_TAG) -t $(_LATEST) -f Dockerfile .
	- $(CONTAINER_TOOL) buildx rm gaga-builder
