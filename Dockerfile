FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

ARG USER
ARG UID
ARG GID

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      curl \
      locales && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

CMD ["/bin/bash"]
