FROM debian:11.5-slim

ARG IDF_VERSION

RUN apt-get update
RUN apt-get install -y \
    bash \
    git \
    wget \
    flex \
    bison \
    gperf \
    python3 \
    python3-pip \
    python3-venv \
    cmake \
    ninja-build \
    ccache \
    libffi-dev \
    libssl-dev \
    dfu-util \
    libusb-1.0-0

ENV IDF_PATH=/esp/idf

WORKDIR $IDF_PATH
RUN git clone -c advice.detachedHead=false --recursive --branch ${IDF_VERSION} --depth 1 https://github.com/espressif/esp-idf.git .

ENV IDF_TOOLS_PATH=/esp
RUN ./install.sh all
RUN ln -s /esp/idf/tools/idf.py /usr/bin/idf

ENV LC_ALL=C

ENTRYPOINT ["bash", "-c", "source $IDF_PATH/export.sh && \"$@\"", "-s"]

CMD ["bash"]

LABEL RUN="podman run --rm -it --name esp-idf --env-host -v /home:/home -v /dev:/dev --workdir=\$PWD IMAGE"
LABEL org.opencontainers.image.source https://github.com/burgrp/esp-idf.git
LABEL org.opencontainers.image.description ESP32 IDF $IDF_VERSION tooling

