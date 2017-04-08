FROM alpine
MAINTAINER Haruhiko Uchida <harre.orz@gmail.com>

RUN apk add --update --no-cache cgit fcgiwrap nginx py3-markdown py3-pygments
ADD etc /etc

EXPOSE 80

CMD rm -f /run/fcgiwrap.sock && fcgiwrap -s unix://run/fcgiwrap.sock & \
    sleep 1 && chown nginx:nginx /run/fcgiwrap.sock && /usr/sbin/nginx & \
    wait

