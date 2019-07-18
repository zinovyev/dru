function tag_info {
  if [[ $OPT_VERBOSE ]]; then
    echo -n "The '${OPT_TAG}' tag will be used for the image. "
    echo -n "To see all possible tags please visit the https://hub.docker.com/_/ruby?tab=tags"
    echo -e "\n"
  fi
}
