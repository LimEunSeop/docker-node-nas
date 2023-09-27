FROM node:lts-alpine

ARG PUBLIC_KEY

RUN set -x \
&& apk add --no-cache openssh \
&& echo 'root:P@ssw0rd' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
&& mkdir -p ~/.ssh/ \
&& echo $PUBLIC_KEY > ~/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]