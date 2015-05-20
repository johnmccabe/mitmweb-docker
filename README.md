# mitmweb docker image
Docker image for the mitmproxy web interface mitmweb pulled from master on https://github.com/mitmproxy/mitmproxy.

Get started by using all the mitmweb defaults and allowing docker to map the proxy and web interface ports.

    docker run --name mitmweb -d -P johnmccabe/mitmweb

Or to explictly map the default ports (proxy: 8080, web interface: 8081)

    docker run --name mitmweb -d -p 8080:8080 -p 8081:8081 johnmccabe/mitmweb

You can view all available mitmweb arguments and options as follows

    docker run johnmccabe/mitmweb -h