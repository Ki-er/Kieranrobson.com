FROM --platform=linux/arm64 debian:11-slim AS deps

RUN apk add --update \
    wget
    
ARG HUGO_VERSION="0.108.0"
RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

COPY ./ /usr/site/src
WORKDIR /usr/site/src
RUN hugo

#Copy static files to Nginx
FROM --platform=linux/arm64 debian:11-slim AS deps
COPY --from=build /usr/site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html