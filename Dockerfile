FROM alpine
MAINTAINER John McCabe <john@johnmccabe.net>

# Expose ports
#   - 8080: Default mitmproxy port
#   - 8081: Default mitmweb port
EXPOSE 8080
EXPOSE 8081

ADD ./requirements.txt /tmp/requirements.txt

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    git \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    openssl-dev \
    && ln -s /lib /lib64 \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache/pip /tmp/pip_build_root

# Location of the default mitmproxy CA files
VOLUME ["/ca"]

ENTRYPOINT [ "/usr/bin/mitmweb", "--cadir", "/ca" ]