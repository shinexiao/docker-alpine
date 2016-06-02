FROM alpine:latest
MAINTAINER leky <lekyzsj@gmail.com>

ENV TZ "Asia/Shanghai"

# Install packages
# Since from alpine v3.3, apk --no-cache will run apk update first,
# and rm -rf /var/cache/apk/* finally.
RUN apk add --no-cache \
    bash \
    curl \
    git \
    tzdata \
    && rm -rf /var/cache/apk/*

# Set default timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
