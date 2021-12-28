FROM debian:11-slim

ARG CLI_VERSION="1.36.0"

WORKDIR /tmp
RUN apt-get update\
  && apt-get install -y wget unzip\
  && wget https://github.com/aws/aws-sam-cli/releases/download/v${CLI_VERSION}/aws-sam-cli-linux-x86_64.zip\
  && unzip aws-sam-cli-linux-x86_64.zip -d sam-installer\
  && ./sam-installer/install\
  && apt-get purge -y --auto-remove wget unzip

RUN apt-get update\
  && apt-get install -y docker git

WORKDIR /data

VOLUME [ "/data" ]

ENTRYPOINT [ "/usr/local/bin/sam" ]