FROM alpine:3.19

RUN apk --update add \
      bash \
      bind-tools \
      binutils \
      coreutils \
      curl \
      docker \
      findutils \
      git \
      grep \
      jq \
      openssh-client \
      openssh-server \
      procps \
      pipx \
      py3-pip \
      python3 \
      sudo \
      util-linux \
      wget \
      xmlstarlet \
      yq

RUN echo 'ansible   ALL = NOPASSWD: ALL' >> /etc/sudoers.d/ansible && \
    chmod 0440 /etc/sudoers.d/ansible

RUN adduser -D ansible && \
    addgroup ansible ping
USER ansible
WORKDIR /home/ansible
env PATH="/home/ansible/.local/bin:$PATH"

RUN pipx install ansible-core

RUN mkdir /home/ansible/.ssh
RUN chmod og-rwx /home/ansible/.ssh
COPY --chown=ansible:ansible --chmod=600 id_rsa /home/ansible/.ssh/id_rsa
COPY --chown=ansible:ansible --chmod=600 id_rsa.pub /home/ansible/.ssh/id_rsa.pub
COPY --chown=ansible:ansible --chmod=644 step-1 /home/ansible/step-1
