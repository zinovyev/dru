source "./assert.sh"
source "../lib/run_in_docker.sh"

[[ -d ./tmp ]] && rm -rf ./tmp

expected_version="2.4.6"
export OPT_DIR="${PWD}/tmp"
export OPT_TAG="${expected_version}-alpine"

ruby_version=$(run_in_docker "ruby -v" | awk -F ' |p' '{ print $2}')

assert_eq $ruby_version, $expected_version, "Wrong ruby version"

[[ -d ./tmp ]] && rm -rf tmp
