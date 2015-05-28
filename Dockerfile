FROM python:2.7.8
MAINTAINER John McCabe <john@johnmccabe.net>

# Expose ports
#   - 8080: Default mitmproxy port
#   - 8081: Default mitmweb port
EXPOSE 8080
EXPOSE 8081

# Install mitmproxy and netlib from master
RUN git clone https://github.com/mitmproxy/netlib.git \
    && git --git-dir=netlib/.git --work-tree=netlib/.git checkout tags/v0.12 \
    && pip install -e netlib \
    && git clone https://github.com/mitmproxy/mitmproxy.git \
    && git --git-dir=mitmproxy/.git --work-tree=mitmproxy/.git checkout tags/v0.12 \
    && pip install -e mitmproxy

# Location of the default mitmproxy CA files
VOLUME ["/ca"]

ENTRYPOINT [ "mitmproxy/mitmweb", "--cadir", "/ca" ]