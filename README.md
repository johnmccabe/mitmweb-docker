[![](https://badge.imagelayers.io/johnmccabe/mitmweb:latest.svg)](https://imagelayers.io/?images=johnmccabe/mitmweb:latest 'Get your own badge on imagelayers.io')
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
