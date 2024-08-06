FROM ruby:3.2.3-alpine
RUN apk update --no-cache && apk add build-base tzdata nodejs libpq-dev postgresql-client --no-cache

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN bundle install

EXPOSE 3000