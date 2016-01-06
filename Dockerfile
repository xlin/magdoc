FROM mageia:5

# Configuring timezone
#RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN urpmi --auto-update
RUN urpmi --auto openssh-server sudo locales-ru

ENV TERM=xterm

RUN \
  useradd -m -d /home/xlin xlin \
  && echo "xlin:tz70xxkeq" | chpasswd \
  && mkdir /home/xlin/.ssh \
  && chown -R xlin:xlin /home/xlin/.ssh \
  && echo "xlin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/xlin \
  && chmod 0440 /etc/sudoers.d/xlin

# Expose the SSH port
EXPOSE 22

# Start SSH
ENTRYPOINT ["/usr/sbin/sshd",  "-D"]

#COPY .bashrc /home/xlin/.bashrc
