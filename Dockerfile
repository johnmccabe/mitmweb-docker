FROM python:2.7.8
MAINTAINER John McCabe <john@johnmccabe.net>

# Export ports
#   - 8080: Default mitmproxy port
#   - 8080: Default mitmweb port
EXPOSE 8080
EXPOSE 8081

# Install mitmproxy and netlib from master
RUN git clone https://github.com/mitmproxy/netlib.git \
    && pip install -e netlib \
    && git clone https://github.com/mitmproxy/mitmproxy.git \
    && pip install -e mitmproxy

# Location of the default mitmproxy CA files
VOLUME ["/ca"]

ENTRYPOINT [ "mitmproxy/mitmweb", "--cadir", "/ca" ]