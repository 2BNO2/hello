FROM ubuntu:18.04

WORKDIR /work
ADD hello_world.c .
VOLUME /file

ENV PATH="/work:${PATH}"

RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install build-essential -y && \
    gcc hello_world.c -o hello

ENTRYPOINT hello && echo "\n" && cat /file/text.txt