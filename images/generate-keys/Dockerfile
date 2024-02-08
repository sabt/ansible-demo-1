FROM alpine:3.19

RUN apk --update add \
      bash \
      binutils \
      coreutils \
      findutils \
      openssh-client \
      openssh-server \
      util-linux

RUN mkdir -p /data/worker_1/etc/ssh \
             /data/worker_2/etc/ssh \
             /data/worker_3/etc/ssh \
             /data/database/etc/ssh \
             /data/main/etc/ssh
RUN ssh-keygen -A -f /data/worker_1/ && \
    ssh-keygen -A -f /data/worker_2/ && \
    ssh-keygen -A -f /data/worker_3/ && \
    ssh-keygen -A -f /data/database/ && \
    ssh-keygen -A -f /data/main/ && \
    ssh-keygen -t rsa -f /data/main/id_rsa

RUN for d in worker_1 worker_2 worker_3 database main; do \
      mv /data/"$d"/etc/ssh/ssh_host_* /data/"$d/" && \
      rmdir /data/"$d"/etc/ssh && \
      rmdir /data/"$d"/etc ; \
    done

RUN cp /data/main/id_rsa.pub /data/worker_1/authorized_keys && \
    cp /data/main/id_rsa.pub /data/worker_2/authorized_keys && \
    cp /data/main/id_rsa.pub /data/worker_3/authorized_keys && \
    cp /data/main/id_rsa.pub /data/database/authorized_keys