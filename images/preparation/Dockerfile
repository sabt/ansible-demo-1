FROM alpine:3.19

RUN apk --update add \
      bash \
      binutils \
      coreutils \
      findutils \
      openssh-client \
      openssh-server \
      util-linux

RUN mkdir -p /mnt/worker_1 /mnt/worker_2 /mnt/worker_3 /mnt/database /mnt/main
RUN ssh-keygen -A -f /mnt/worker_1/ && \
    ssh-keygen -A -f /mnt/worker_2/ && \
    ssh-keygen -A -f /mnt/worker_3/ && \
    ssh-keygen -A -f /mnt/database/ && \
    ssh-keygen -A -f /mnt/main/ && \
    ssh-keygen -t rsa -f /mnt/main/id_rsa && \
    cp /mnt/main/id_rsa.pub /mnt/worker_1/authorized_keys && \
    cp /mnt/main/id_rsa.pub /mnt/worker_2/authorized_keys && \
    cp /mnt/main/id_rsa.pub /mnt/worker_3/authorized_keys && \
    cp /mnt/main/id_rsa.pub /mnt/database/authorized_keys

RUN for d in worker_1 worker_2 worker_3 database main; do \
      mv /mnt/"$d"/etc/ssh/ssh_host_* /mnt/"$d/" && \
      rmdir /mnt/"$d"/etc/ssh && \
      rmdir /mnt/"$d"/etc ; \
    done
