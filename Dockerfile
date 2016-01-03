FROM mageia:5

# Configuring timezone
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

#Install nginx

RUN urpmi --auto-update
RUN urpmi nginx

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN \
  mkdir /etc/nginx/ssl && \
  chown -R nginx.nginx /etc/nginx/ssl

VOLUME ["/etc/nginx/ssl"]
VOLUME ["/var/log/nginx"]
VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY html/ /usr/share/nginx/html
COPY ssl/ /etc/nginx/ssl