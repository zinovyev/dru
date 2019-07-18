# Parse output
for arg in $@; do
  shift
  case "$arg" in
    -d|--dir)
      OPT_DIR=$1
    ;; 
    -t|--tag)
      OPT_TAG=$1
    ;;
    -e|--exec)
      OPT_EXEC=$*
    ;;
    -v|--verbose)
      OPT_VERBOSE=true
    ;;
    -r|--rails)
      OPT_RAILS=$1
    ;;
    run|rails|irb|project|help|update|uninstall)
      COMMAND=$arg
    ;;
    *)
  esac
done

# Set default values
[[ -z "$OPT_DIR" ]] && OPT_DIR=$PWD
[[ -z "$OPT_TAG" ]] && OPT_TAG="alpine"
[[ -z "$COMMAND" ]] && COMMAND="help"


# Debug
if [[ $OPT_VERBOSE ]]; then
  echo "DEBUG: dir: ${OPT_DIR} | tag: ${OPT_TAG} | exec: ${OPT_EXEC} | command: ${COMMAND}"
fi

# Execute commands
case $COMMAND in
  run)
    cmd_run
  ;;
  irb)
    cmd_irb
  ;;
  rails)
    cmd_rails
  ;;
  project)
    cmd_project
  ;;
  update)
    cmd_update
  ;;
  uninstall)
    cmd_uninstall
  ;;
  *)
    cmd_help
  ;;
esac
