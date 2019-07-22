function run_in_docker {
  DOCKER_COMMAND=$1
  FULL_COMMAND="docker run --rm -v \"${OPT_DIR}:/usr/src\" -v \"dru1-bundle:/usr/local/bundle\" \
                                -v \"dru1-gem:/root/.gem\" -v \"dru1-apk:/var/cache/apk\" \
                                -w /usr/src -ti ruby:${OPT_TAG} $DOCKER_COMMAND"
  [[ $OPT_VERBOSE ]] && echo $FULL_COMMAND
  eval $FULL_COMMAND
  [[ -z $OPT_CHOWN ]] && chown_dir
}
