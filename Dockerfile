FROM alpine:edge

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --no-cache add python \
    py-pip \
    py-m2crypto \
    libsodium \
    git&& \
    pip install cymysql

RUN git clone -b docker https://github.com/ManSoraTech/legendsocks.git legendsocks

ENTRYPOINT ["/legendsocks/docker_run.sh"]
 
CMD ["server.py"]

