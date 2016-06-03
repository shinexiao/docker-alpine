FROM alpine:latest
MAINTAINER leky <lekyzsj@gmail.com>

ENV TZ "Asia/Shanghai"

# Official alpine mirrors: http://rsync.alpinelinux.org/alpine/MIRRORS.txt
# Install packages
# Since from alpine v3.3, apk --no-cache will run apk update first,
# and rm -rf /var/cache/apk/* finally.
RUN ALPINE_REPO_VERSION=$(grep -Eo /etc/apk/reposistories | uniq) \
    && echo "http://mirrors.ustc.edu.cn/alpine/v${ALPINE_REPO_VERSION}/main" > /etc/apk/repositories \
    && echo "http://mirrors.ustc.edu.cn/alpine/v${ALPINE_REPO_VERSION}/community" >> /etc/apk/repositories \
    && apk add --no-cache \
      tzdata \
    && rm -rf /var/cache/apk/*

# Set default timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
