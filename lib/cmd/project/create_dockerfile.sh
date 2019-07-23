function create_dockerfile() {
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
}
