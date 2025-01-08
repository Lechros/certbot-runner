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

COPY create-certificate.sh create-certificate.sh
RUN chmod +x create-certificate.sh

ARG LOAD_BALANCER_OCID
ARG CERTIFICATE_NAME
ENV LOAD_BALANCER_OCID=$LOAD_BALANCER_OCID
ENV CERTIFICATE_NAME=$CERTIFICATE_NAME

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
