FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssh-server openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/sshd

RUN echo 'root:password' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
