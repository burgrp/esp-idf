# ESP32 IDF tooling in container


## Use the image

To build your ESP32 project in current directory, run:
```sh
podman container runlabel run burgrp/esp-idf:v4.4.2 idf.py build
```

## Dev notes

### Build and push the image

```sh
./build-image v4.4.2
```
