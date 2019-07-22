function chown_dir {
  DOCKER_USER_ID=$(id -u)
  DOCKER_GROUP_ID=$(id -g)
  OPT_CHOWN=1
  run_in_docker "sh -c 'chown -R ${DOCKER_USER_ID}:${DOCKER_GROUP_ID} /usr/src'"
}
