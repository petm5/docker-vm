FROM alpine:latest

RUN apk update
RUN apk add socat qemu-system-x86_64

RUN mkdir /storage

ADD entry.sh /opt/entry.sh

CMD "/opt/entry.sh"
