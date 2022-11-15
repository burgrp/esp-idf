# ESP32 IDF tooling in container


## Use the image as VS Code dev container

To start the dev container, run:
```sh
podman container runlabel dev ghcr.io/burgrp/esp-idf:v5.0-rc1
```

## Use the image as one-shot idf command

To build and flash project in the current directory, run:
```sh
podman container runlabel idf ghcr.io/burgrp/esp-idf:v5.0-rc1 flash
```



## Dev notes

### Build and push the image

```sh
./build-image
```
