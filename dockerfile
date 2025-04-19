FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    binutils \
    build-essential \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    fonts-takao \
    fio \
    qemu-kvm \
    virt-manager \
    libvirt-clients \
    virtinst \
    jq \
    docker.io \
    containerd \
    libvirt-daemon-system \
    curl \
    git \
    vim \
    wget \
    sudo \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -m -s /bin/bash linuxuser && \
    echo "linuxuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN adduser linuxuser libvirt && \
    adduser linuxuser libvirt-qemu && \
    adduser linuxuser kvm

USER linuxuser

CMD ["/bin/bash"]
