.DEFAULT_GOAL := help
.PHONY: dev code build flash help

IMAGE_NAME=__IMAGE_NAME__
CONTAINER_NAME=esp-idf

start: ## Creates and starts devcontainer
	podman run --restart=always --detach -it --name ${CONTAINER_NAME} -v /home:/home -v /dev:/dev --workdir=${PWD} ${IMAGE_NAME}

stop: ## Stops and removes devcontainer
	podman rm -f ${CONTAINER_NAME}

code: ## Starts VS Code connected to the devcontainer
	code --folder-uri vscode-remote://attached-container+$(shell echo -n '{"containerName":"${CONTAINER_NAME}"}'| hexdump -v -e '/1 "%02X"')${PWD}

enter: ## Executes bash inside devcontainer
	podman exec -ti ${CONTAINER_NAME} bash

build: ## Builds project using "idf build"
	./idf build

flash: ## Flashes the target using "idf flash"
	./idf flash

help:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
