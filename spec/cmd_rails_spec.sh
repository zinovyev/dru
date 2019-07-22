source "./assert.sh"
source "../lib/tag_info.sh"
source "../lib/run_in_docker.sh"
source "../lib/empty_mounted_directory.sh"
source "../lib/cmd/rails.sh"

empty_mounted_directory

expected_version="2.5.0"
export OPT_DIR="${PWD}/tmp"
export OPT_TAG="${expected_version}-alpine"
export OPT_RAILS="6.0.0.rc1"
export OPT_EXEC="new . --database=postgresql"

cmd_rails

wc_all=$(ls ./tmp* | wc -l)
assert_gt $wc_all 0 "Rails dir should not be empty"
[[ "$?" == 0 ]] && log_success "Rails dir is not empty"

wc_app=$(find ./tmp -maxdepth 1 -type d -name app | wc -l)
assert_eq $wc_app 1 "Rails dir should contain app dir"
[[ "$?" == 0 ]] && log_success "Rails dir contains app directory"

empty_mounted_directory

