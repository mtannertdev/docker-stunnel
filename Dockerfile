FROM alpine:3.8

MAINTAINER Mark Tannert <mark@tannert.net>

COPY ./bin /usr/local/bin
#COPY ./src /src

RUN apk add --no-cache bash openssl openssl-dev gcc musl-dev make

WORKDIR /src
RUN wget ftp://ftp.stunnel.org/stunnel/archive/5.x/stunnel-5.51.tar.gz
RUN tar -xvf stunnel-5.51.tar.gz
WORKDIR /src/stunnel-5.51
RUN ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make install

WORKDIR /
RUN rm -rf /src && apk del --no-cache make musl-dev gcc openssl-dev

VOLUME ["/etc/stunnel"]

CMD ["run_stunnel.sh"]

