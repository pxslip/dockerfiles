FROM debian:bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends openssl

ENTRYPOINT ["/usr/bin/openssl"]