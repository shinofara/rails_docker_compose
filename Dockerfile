FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /work/app
ADD Gemfile /work/app/Gemfile
ADD Gemfile.lock /work/app/Gemfile.lock
ADD . /work/app
RUN bundle install