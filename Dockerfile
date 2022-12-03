FROM ruby:3.1-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
      make \
      gcc
COPY Gemfile* .
RUN bundle config set --local deployment true
RUN bundle install

COPY . .

CMD ["bin/start"]
