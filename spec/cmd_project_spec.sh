source "./assert.sh"
source "../lib/tag_info.sh"
source "../lib/run_in_docker.sh"
source "../lib/empty_mounted_directory.sh"
source "../lib/cmd/project/create_dockerfile.sh"
source "../lib/cmd/project/create_docker_compose.sh"
source "../lib/cmd/project/replace_database_yml.sh"
source "../lib/cmd/project.sh"

empty_mounted_directory
mkdir -p $OPT_DIR

expected_version="2.5.0"
export OPT_DIR="${PWD}/tmp"
export OPT_TAG="${expected_version}-alpine"

cmd_project

wc_all=$(ls ./tmp/* | wc -l)
assert_eq $wc_all 2 "Empty project directory contains 2 files"
[[ "$?" == 0 ]] && log_success "Empty project directory contains 2 files" || exit $?

wc_app=$(find ./tmp -maxdepth 1 -type d -name Dockerfile | wc -l)
assert_eq $wc_app 1 "Project directory contains Dockerfile"
[[ "$?" == 0 ]] && log_success "Project directory contains Dockerfile" || exit $?

wc_app=$(find ./tmp -maxdepth 1 -type d -name docker-compose.yml | wc -l)
assert_eq $wc_app 1 "Project directory contains docker-compose.yml"
[[ "$?" == 0 ]] && log_success "Project directory contains docker-compose.yml" || exit $?

empty_mounted_directory
