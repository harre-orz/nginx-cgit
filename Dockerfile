FROM alpine:edge

RUN apk update && apk add --no-cache nginx cgit fcgiwrap highlight py3-markdown py3-pygments

ADD nginx.conf /etc/nginx/nginx.conf
ADD cgitrc /etc/cgitrc
ADD nginx.sh /usr/sbin/nginx.sh

CMD /usr/sbin/nginx.sh
