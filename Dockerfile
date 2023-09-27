FROM node:lts-alpine

RUN apk update && apk add openssh-server

VOLUME /home/node/.ssh
VOLUME /etc/ssh

EXPOSE 22