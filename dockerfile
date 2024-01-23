FROM alpine:3.9 AS build

ARG VERSION="0.92.0"

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN /hugo version

RUN apk add --no-cache git

COPY . /site
WORKDIR /site

RUN /hugo 

FROM nginx:1.15-alpine

WORKDIR /usr/share/nginx/html/

RUN rm -fr * .??*

RUN sed -i '9i\        include /etc/nginx/conf.d/expires.inc;\n' /etc/nginx/conf.d/default.conf

COPY --from=build /site/public /usr/share/nginx/html
