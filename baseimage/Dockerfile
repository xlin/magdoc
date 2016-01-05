FROM mageia:5

# Configuring timezone
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN urpmi --auto-update
RUN urpmi --auto openssh-server

RUN \
  && useradd -M xlin \
  && echo "xlin:tz70xxkeq" | chpasswd \
  && mkdir /home/xlin/.ssh \
  && chown -R xlin:xlin /home/xlin/.ssh

# Expose the SSH port
EXPOSE 22

# Start SSH
ENTRYPOINT ["/usr/sbin/sshd",  "-D"]
