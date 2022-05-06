# 参考:https://gist.github.com/tobi/7fcd2004fb5ee974e5ffcf5fef48edfe

FROM ruby:2.7.6

ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.7/litestream-v0.3.7-linux-arm64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz && \
    apt-get update &&  \
    apt-get install -y sqlite3 && \
    rm -rf /var/lib/apt/lists/*

ARG RAILS_ENV=development
ENV DB_PATH '/data/$RAILS_ENV.sqlite3'
ENV REPLICA_URL 'gcs://sub-db/$RAILS_ENV.sqlite3'
ENV GOOGLE_APPLICATION_CREDENTIALS 'config/credentials.json'
ARG SECRET_KEY_BASE

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle config set --local without 'development test' && \
    bundle install

ADD . /app
# RUN bundle exec rake assets:precompile

RUN mkdir "/data" && \
    ln -nfs $DB_PATH /app/db/$RAILS_ENV.sqlite3

EXPOSE 8080

CMD \
  [ ! -f ${DB_PATH} ] && litestream restore -v -if-replica-exists -o $DB_PATH "${REPLICA_URL}" \
  ; bundle exec rake db:migrate \
  ; litestream replicate -exec "bundle exec rails server -b 0.0.0.0 -p 8080" $DB_PATH $REPLICA_URL
