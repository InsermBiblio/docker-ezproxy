FROM php:5.6-cli

ENV VERSION 6-3-5

RUN apt-get update \
  && apt-get -y install curl lib32z1 dnsutils vim  \
  && apt-get clean

WORKDIR /usr/local/ezproxy

RUN curl -sS -k https://www.oclc.org/content/dam/support/ezproxy/documentation/download/binaries/$VERSION/ezproxy-linux.bin > ./ezproxy \
&& chmod 755 ./ezproxy

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 50162
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
