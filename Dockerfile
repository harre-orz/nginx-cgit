FROM alpine:edge

RUN apk add --update --no-cache cgit fcgiwrap git-daemon highlight nginx py3-markdown py3-pygments supervisor

ADD cgitrc /etc/cgitrc
ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80 9418

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
