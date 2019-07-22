source "./assert.sh"
source "../lib/run_in_docker.sh"
source "../lib/empty_mounted_directory.sh"

empty_mounted_directory

expected_version="2.4.6"
export OPT_DIR="${PWD}/tmp"
export OPT_TAG="${expected_version}-alpine"

ruby_version=$(run_in_docker "ruby -v" | awk -F ' |p' '{ print $2}')

assert_eq $ruby_version, $expected_version, "Wrong ruby version"
[[ "$?" == 0 ]] && log_success "Ruby version is ${expected_version}" || exit $?

empty_mounted_directory

