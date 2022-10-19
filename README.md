# ESP32 IDF tooling in container

## Use the image

To build your ESP32 project in current directory, run:
```sh
podman container runlabel run burgrp/esp-idf:v5.0-beta1 idf.py build
```

## Dev notes

### Build and push the image

```sh
./build-image v5.0-beta1
```