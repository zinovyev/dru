function create_docker_compose() {
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
    command: ash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
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
