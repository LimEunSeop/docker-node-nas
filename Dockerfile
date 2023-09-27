FROM node:lts-alpine

RUN apk update && apk add openssh-server