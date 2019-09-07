FROM alpine:3.10.2

RUN apk add --update --no-cache nginx openssl gettext

ENV PROXY_HOST=localhost
ENV PROXY_PORT=443
ENV TARGET_HOST=
ENV TARGET_PORT=

EXPOSE ${PROXY_PORT}

ADD nginx.conf.template /
ADD configure-and-run.sh /

ENTRYPOINT ["/configure-and-run.sh"]
