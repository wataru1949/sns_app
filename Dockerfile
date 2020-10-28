FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    vim

WORKDIR /sns_app

ADD Gemfile /sns_app/Gemfile
ADD Gemfile.lock /sns_app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /sns_app

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids