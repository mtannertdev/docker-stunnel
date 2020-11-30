FROM alpine:3.8

MAINTAINER Mark Tannert <mark@tannert.net>

COPY ./bin /usr/local/bin
#COPY ./src /src

RUN apk add --no-cache bash openssl openssl-dev gcc musl-dev make

WORKDIR /src
RUN wget https://www.stunnel.org/downloads/stunnel-5.57.tar.gz
RUN tar -xvf stunnel-5.57.tar.gz
WORKDIR /src/stunnel-5.57
RUN ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make install

WORKDIR /
RUN rm -rf /src && apk del --no-cache make musl-dev gcc openssl-dev

VOLUME ["/etc/stunnel"]

CMD ["run_stunnel.sh"]

