CONTAINER_TOOL := docker

_PLATFORMS ?= linux/arm64,linux/amd64
_TAG       ?= asd

.PHONY: all

all:
	- $(CONTAINER_TOOL) buildx create --name=gaga-builder
	$(CONTAINER_TOOL) buildx use gaga-builder
	$(CONTAINER_TOOL) buildx build --push --platform=$(_PLATFORMS) --tag=$(_TAG) -f Dockerfile .
	- $(CONTAINER_TOOL) buildx rm gaga-builder
