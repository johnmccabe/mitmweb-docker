FROM alpine:3.4
MAINTAINER John McCabe <john@johnmccabe.net>

# Expose ports
#   - 8080: Default mitmproxy port
#   - 8081: Default mitmweb port
EXPOSE 8080
EXPOSE 8081

ADD ./requirements.txt /tmp/requirements.txt

RUN apk add --no-cache \
    python3 \
    python3-dev \
    build-base \
    git \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    openssl-dev \
    && python3 -m ensurepip \
    && ln -s /lib /lib64 \
    && pip3 install -r /tmp/requirements.txt \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache/pip \
    && rm -rf /tmp/pip_build_root \
    && rm -rf /root/.cache \
    && rm -rf /usr/lib/python*/ensurepip

# Location of the default mitmproxy CA files
VOLUME ["/ca"]

ENTRYPOINT [ "/usr/bin/mitmweb", "--cadir", "/ca", "--wiface", "0.0.0.0" ]