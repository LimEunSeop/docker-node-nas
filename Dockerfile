FROM node:lts-alpine

RUN set -x \
&& npm i -g pm2 \
&& apk add --no-cache openssh \
# && sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& sed 's/#PasswordAuthentication yes/PasswordAuthentication yes/' -i /etc/ssh/sshd_config \
&& echo 'node:P@ssw0rd' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
&& mkdir -p /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]