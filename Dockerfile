FROM ruby:3.2.3-alpine
RUN apk update --no-cache && apk add build-base tzdata nodejs libpq-dev postgresql-client --no-cache

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

RUN rm -f tmp/pids/server.pid

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rails s -p 3000 -b '0.0.0.0'"]