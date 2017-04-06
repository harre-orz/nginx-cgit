FROM alpine:edge

RUN apk add --update --no-cache cgit fcgiwrap git-daemon highlight nginx py3-markdown py3-pygments supervisor

ADD etc /etc

EXPOSE 80 9418

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
