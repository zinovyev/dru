function cmd_project {
  # Add Dockerfile
  FULL_COMMAND="docker run --rm -v ${OPT_DIR}:/usr/src -v dru1-bundle:/usr/local/bundle -v dru1-gem:/root/.gem \
                           -v dru1-apk:/var/cache/apk -w /usr/src -ti ruby:${OPT_TAG} $DOCKER_COMMAND"

  DOCKER_FILE="${OPT_DIR}/Dockerfile"
  cat >$DOCKER_FILE <<EOL
FROM ruby:$OPT_TAG
ENV APP_PATH="/usr/src"
ENV RAILS_PORT=3000

RUN apk add --update build-base postgresql-dev sqlite-dev mariadb-dev nodejs tzdata 1>/dev/null
RUN mkdir -p \$APP_PATH
WORKDIR \$APP_PATH
COPY Gemfile \$APP_PATH/Gemfile
COPY Gemfile.lock \$APP_PATH/Gemfile.lock
RUN bundle install
COPY . \$APP_PATH

EXPOSE \$RAILS_PORT

CMD ["rails", "server", "-b", "0.0.0.0"]
EOL

  # Add docker-compose.yml
  DOCKER_COMPOSE_FILE="${OPT_DIR}/docker-compose.yml"
  cat >$DOCKER_COMPOSE_FILE <<EOL
version: '3'
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/usr/src
      - dru1-bundle:/usr/local/bundle
      - dru1-gem:/root/.gem
      - dru1-apk:/var/cache/apk
    ports:
      - "3000:3000"
    depends_on:
      - db
volumes:
  dru1-bundle:
  dru1-gem:
  dru1-apk:
EOL
}
