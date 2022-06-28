# Dockefile CABC2022
#
FROM ubuntu:20.04

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt -y upgrade && apt install -y language-pack-ja-base language-pack-ja \
    locales tzdata man-db nkf curl\
    nano wget vim git iproute2 python3 && \
    locale-gen ja_JP.UTF-8 && yes | unminimize
ENV LANGUAGE=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
RUN apt-get clean & rm -rf /var/lib/apt/lists/* 

RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/sh -u $UID -g $GID $USERNAME 
USER $USERNAME
WORKDIR /home/$USERNAME/
CMD /bin/bash

