FROM node:lts-alpine

RUN set -x \
&& apk add --no-cache openssh \
&& sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& echo 'root:P@ssw0rd' | chpasswd \
&& ssh-keygen  -N '' -t rsa \
&& ssh-keygen  -N '' -t dsa \
&& mkdir -p /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]