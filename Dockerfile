FROM debian/eol:jessie

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
        build-essential pkg-config gettext \
        make git autoconf automake \
# X11 dependencies
        libxext-dev libx11-dev libxdamage-dev libxfixes-dev \
        libxext-dev libx11-dev libxdamage-dev libxfixes-dev \
        libxxf86vm-dev libxmu-dev libxi-dev libxrandr-dev \
        x11proto-core-dev x11proto-gl-dev x11proto-xext-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd / && git clone https://github.com/YaQia/parsec-container.git && \
    cd /parsec-container && source env.sh && parsecmgmt -a build

WORKDIR /parsec-container
CMD ["bash"]

