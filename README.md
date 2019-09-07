# Docker Image for Reverse Proxy-based Tests

This Docker image provides a configurable HTTPS reverse proxy useful for testing publishing documentation to Confluence 
via a reverse proxy, e.g. as part of integration tests based on test containers.


## Configuration Options

The following configuration options are available via environment variables:

Name | Description | Required
---- | ----------- | -------
PROXY_HOST     | Host name of the proxy to listen on | yes
PROXY_PORT     | Port of the proxy to listen on (HTTPS) | yes
TARGET_HOST    | Host name used to communicate with the target (must be resolvable from within Docker container)| yes
TARGET_PORT    | Port used to communicate with the target (must be accessible from within Docker container) | yes


## Build Reverse Proxy Integration Test Image
Run the following command to build and push the image:

`docker build -t confluencepublisher/reverse-proxy-it:<version> .`

`docker push confluencepublisher/reverse-proxy-it:<version>` (requires access to DockerHub for confluencepublisher)


## Run Reverse Proxy Integration Test Image
Run the following command to start the container (with SSL enabled, running on port 8443, proxying to 
http://target.host:8080):

`docker run --rm -d -p8443:8443 \
  -e PROXY_HOST=proxy.host \
  -e PROXY_PORT=8443 \
  -e TARGET_HOST=target.host \
  -e TARGET_PORT=8080 \
  confluencepublisher/reverse-proxy-it:<version>`
