FROM ghcr.io/oracle/oci-cli:latest

USER root
WORKDIR /root

RUN yum -y update && \
  yum -y install openssh-server

RUN mkdir -p /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN ssh-keygen -A

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/^#LogLevel .*/LogLevel INFO/' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
