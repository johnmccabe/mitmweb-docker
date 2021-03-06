[![](https://images.microbadger.com/badges/image/johnmccabe/mitmweb.svg)](https://microbadger.com/images/johnmccabe/mitmweb "Get your own image badge on microbadger.com")
# mitmweb docker image
Alpine based docker image for the mitmproxy web interface mitmweb.

Get started quickly with defaults allowing docker to map the proxy and web interface ports.

    docker run --name mitmweb -d -P johnmccabe/mitmweb

Or to explictly map the default ports (proxy: 8080, web interface: 8081)

    docker run --name mitmweb -d -p 8080:8080 -p 8081:8081 johnmccabe/mitmweb

You can view all available mitmweb arguments and options as follows

    docker run johnmccabe/mitmweb -h

Refer to the mitmproxy page for details

- https://github.com/mitmproxy/mitmproxy
