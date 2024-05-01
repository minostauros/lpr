FROM    ubuntu:20.04

WORKDIR    /

# Needed for string substitution
SHELL ["/bin/bash", "-c"]
# https://techoverflow.net/2019/05/18/how-to-fix-configuring-tzdata-interactive-input-when-building-docker-images/
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ=Asia/Seoul

RUN apt-get -y update -qq --fix-missing && \
    apt-get -y install --no-install-recommends \
        cups \
        cups-bsd \
        && \
# cleaning
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/sh", "-c" , "service cups start && bash"]
WORKDIR /workspace
