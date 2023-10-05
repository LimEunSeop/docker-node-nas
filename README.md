# docker-node-nas

## Introduction

This project has been making for people who want to let SSH Server of the docker-node enabled.
Due to the Dockerfile can't be used at the Container Station of NAS, It's needed for me to push custom docker image from my PC to the DockerHub and pull it to my NAS.
Maintaining it as long as I don't throw away my NAS, you can follow me with no worries.

## How to use it

This container is for those who need SSH server to be installed in node container and you must access the SSH server by key exchange authentication (PasswordAuthentication is disabled).

Here is how i use it from docker-compose.yml

```yml
version: '2'

services:
  silverflame_app:
    image: 'dmstjq12/docker-node-nas'
    user: 'root'
    working_dir: /root/app
    environment:
      - NODE_ENV=production
      - LETSENCRYPT_HOST=www.silverflame.dev
      - VIRTUAL_HOST=www.silverflame.dev
      - VIRTUAL_PORT=3000
    volumes:
      - /share/ServerVolumes/www/app:/root/app
      - /share/ServerVolumes/www/ssh:/root/.ssh
    expose:
      - '3000'
      - '22'
    command: sh -c "/usr/sbin/sshd && pm2-runtime start --name silverflame_app node -- server.js"
    networks:
      - proxy-network
    restart: always
networks:
  proxy-network:
    name: proxy-network
```

What you should note is:

1. You should use root user so that SSH acceess from client, which can be Jenkins, is done easily.
2. `/root/.ssh` volume should be mounted so that `authorized_keys` file from the server is not lost.
3. Port 22 must be exposed and it's optional to open another port if you are going to run web server.
4. command는 아직 확실하진 않네요. 나중에 제대로 알아보고 다시 작성하겠습니다.

> In SSH Client, you better use `-o "StrictHostKeyChecking=no"` option to avoid errors(에러명 찾기).

> If you only need the docker container of node, you can use official node container (https://hub.docker.com/_/node/)
