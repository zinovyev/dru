function cmd_project {
  mkdir -p $OPT_DIR
  create_dockerfile
  create_docker_compose
  replace_database_yml
}
