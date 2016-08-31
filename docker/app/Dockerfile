FROM ruby:2.3-alpine

RUN apk update && apk upgrade

RUN apk add --update build-base mysql-dev nodejs tzdata && \
    rm -rf /var/cache/apk/*

ENV app /work/app
WORKDIR $app

# bundle install pathをdata containarに変更
ENV BUNDLE_PATH /bundle

ARG app_dir
COPY $app_dir $app