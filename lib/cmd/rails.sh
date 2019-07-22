function cmd_rails {
  tag_info
  [[ -z "$OPT_EXEC" ]] && OPT_EXEC="--help"
  [[ -n "$OPT_RAILS" ]] && RAILS_VERSION="-v $OPT_RAILS"
  SUSPEND_LOG=$([[ -z $OPT_VERBOSE ]] && echo "1>/dev/null")
  DOCKER_COMMAND="apk add --update build-base postgresql-dev sqlite-dev mariadb-dev \
                                   nodejs tzdata $SUSPEND_LOG && \
                  gem install rails $RAILS_VERSION $SUSPEND_LOG && rails ${OPT_EXEC}"
  run_in_docker "sh -c '$DOCKER_COMMAND'"
}
