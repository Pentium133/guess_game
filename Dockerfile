FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential && mkdir /guess
WORKDIR /guess
ADD . /guess
RUN bundle install