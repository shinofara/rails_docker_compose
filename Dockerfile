FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /work/app
ADD ./src/Gemfile /work/app/Gemfile
ADD ./src/Gemfile.lock /work/app/Gemfile.lock
ADD ./src /work/app
RUN bundle install