FROM ruby:2.7.2-alpine3.13

RUN apk upgrade --update-cache --available && \
    apk add alpine-sdk && \
    apk add openssl && \
    rm -rf /var/cache/apk/*

RUN gem install jekyll bundler
WORKDIR /app
