FROM ruby:2.3-alpine

RUN apk update && \
    apk upgrade

RUN apk add --update build-base mysql-dev nodejs tzdata && \
    rm -rf /var/cache/apk/*


#    curl-dev ruby-dev build-base bash \
#    zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mysql-dev \
#    ruby-json yaml nodejs && \

WORKDIR /work/app
ADD ./src/Gemfile /work/app/Gemfile
ADD ./src/Gemfile.lock /work/app/Gemfile.lock
COPY ./src /work/app
RUN bundle install && \
    bundle clean