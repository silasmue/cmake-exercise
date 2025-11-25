FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    vim \
    libeigen3-dev \
    libboost-all-dev \
    libgmp-dev \
    libmpfr-dev \
    python3 \
    python3-pip \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget -q https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip -O yaml-cpp.zip \
 && unzip yaml-cpp.zip \
 && mkdir -p yaml-cpp-yaml-cpp-0.6.3/build \
 && cd yaml-cpp-yaml-cpp-0.6.3/build \
 && cmake -DYAML_BUILD_SHARED_LIBS=on ../ \
 && make -j"$(nproc)" \
 && make install \
 && cd /tmp \
 && rm -rf yaml-cpp-0.6.3.zip yaml-cpp-yaml-cpp-0.6.3

ENV LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"

# Setup workdir to mount, to mount files
WORKDIR /opt/cmake-exercise

CMD ["/bin/bash"]
