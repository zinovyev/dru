function chown_dir {
  sudo chown -R "$USER:$(id -gn)" $OPT_DIR
}
