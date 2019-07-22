function empty_mounted_directory() {
  if [[ -d $OPT_DIR ]]; then
    run_in_docker "rm -rf /usr/src/*"
    sleep 1
  fi
}
