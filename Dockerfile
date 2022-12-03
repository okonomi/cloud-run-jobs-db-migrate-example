FROM ruby:3.1-slim

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=1
ENV RAILS_SERVE_STATIC_FILES=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
      gcc \
      libmariadb-dev \
      make
COPY Gemfile* .
RUN bundle config set --local without "development test"
RUN bundle config set --local deployment "true"
RUN bundle install

COPY . .

RUN bin/rails assets:precompile

CMD ["bin/start"]
