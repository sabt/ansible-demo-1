FROM alpine:3.19
RUN apk --update add openssh-server bash python3 sudo

# Copy the ssh server keys
COPY ssh_host_* /etc/ssh/
RUN chmod -R go-rwx /etc/ssh

# Allow ansible to sudo -u root ... without a password
RUN echo 'ansible   ALL = NOPASSWD: ALL' >> /etc/sudoers.d/ansible && \
    chmod 0440 /etc/sudoers.d/ansible

# Create the ansible user
RUN adduser -D ansible && passwd -u ansible
USER ansible

# Add the amsible user authorized_keys
RUN  mkdir /home/ansible/.ssh
COPY --chown=ansible:ansible --chmod=0600 id_rsa.pub /home/ansible/.ssh/authorized_keys
RUN chmod -R og-rwx /home/ansible/.ssh

# Start the sshd and switch back to user ansible
USER root
CMD /usr/sbin/sshd -D
