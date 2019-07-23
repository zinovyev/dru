source "./assert.sh"
source "../lib/chown_dir.sh"
source "../lib/tag_info.sh"
source "../lib/run_in_docker.sh"
source "../lib/empty_mounted_directory.sh"
source "../lib/cmd/project/create_dockerfile.sh"
source "../lib/cmd/project/create_docker_compose.sh"
source "../lib/cmd/project/replace_database_yml.sh"
source "../lib/cmd/project.sh"

expected_version="2.5.0"
export OPT_DIR="${PWD}/project"
export OPT_TAG="${expected_version}-alpine"

cmd_project

wc_all=$(ls ./project/* | wc -l)
assert_eq $wc_all 2 "Empty project directory contains 2 files"
[[ "$?" == 0 ]] && log_success "Empty project directory contains 2 files" || exit $?

wc_app=$(find ./project -maxdepth 1 -type f -name Dockerfile | wc -l)
assert_eq $wc_app 1 "Project directory contains Dockerfile"
[[ "$?" == 0 ]] && log_success "Project directory contains Dockerfile" || exit $?

wc_app=$(find ./project -maxdepth 1 -type f -name docker-compose.yml | wc -l)
assert_eq $wc_app 1 "Project directory contains docker-compose.yml"
[[ "$?" == 0 ]] && log_success "Project directory contains docker-compose.yml" || exit $?

empty_mounted_directory

mkdir -p "${OPT_DIR}/config"
touch "${OPT_DIR}/config/database.yml"

cmd_project

wc_all=$(find ./project -maxdepth 1 -type f | wc -l)
assert_eq $wc_all 2 "Empty project directory contains 2 files"
[[ "$?" == 0 ]] && log_success "Empty project directory contains 2 files" || exit $?

wc_app=$(find ./project/config -maxdepth 1 -type f -name database.yml | wc -l)
assert_eq $wc_app 1 "Project directory contains database.yml"
[[ "$?" == 0 ]] && log_success "Project directory contains database.yml" || exit $?

wc_app=$(find ./project/config -maxdepth 1 -type f -name database.yml.bkp | wc -l)
assert_eq $wc_app 1 "Project directory contains database.yml.bkp"
[[ "$?" == 0 ]] && log_success "Project directory contains database.yml.bkp" || exit $?

rm -rf ./project

