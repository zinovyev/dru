function cmd_help {
  echo "dru $VERSION"
  echo
  echo "COMMANDS:"
  echo "dru shell     Runs sh from a ruby conainer"
  echo "dru irb       Runs irb from a ruby conainer"
  echo "dru rails     Runs rails command in the container"
  echo "dru project   Generate Dockerfile and docker-compose.yml files"
  echo "dru update    Updates dru to the latest stable release"
  echo "dru uninstall Removes dru from your machine"
  echo
  echo "OPTIONS:"
  echo "-d or --dir   Mount directory (default: current directory)"
  echo "-t or --tag   Tag of ruby image (default: alpine)"
  echo "-e or --exec  Execute a custom command in the container"
}
