FROM fedora:22
MAINTAINER John McCabe <john@johnmccabe.net>

# Expose ports
#   - 8080: Default mitmproxy port
#   - 8081: Default mitmweb port
EXPOSE 8080
EXPOSE 8081

# Install build dependencies
RUN dnf -y update && \
    dnf -y install \
        libffi-devel \
        libxml2-devel \
        libxslt-devel \
        zlib-devel \
        libjpeg-devel \
        libwebp-devel \
        openssl-devel \
        python-devel \
        python-pip \
        gcc \
        git && dnf clean all

# Install mitmproxy and netlib
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Location of the default mitmproxy CA files
VOLUME ["/ca"]

ENTRYPOINT [ "/usr/bin/mitmweb", "--cadir", "/ca" ]
