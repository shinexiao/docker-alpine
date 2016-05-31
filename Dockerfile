FROM alpine:latest
MAINTAINER leky <lekyzsj@gmail.com>

ENV TZ "Asia/Shanghai"

# Install packages
RUN apk update \
    && apk add --no-cache \
    bash \
    tzdata \
    && rm -rf /var/cache/apk/*

# Set default timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

