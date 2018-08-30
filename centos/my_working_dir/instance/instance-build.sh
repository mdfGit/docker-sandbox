#!/usr/bin/env bash

main() {
  # TODO(blake): proper logging framework
  echo "Starting $0 at $( date )"

  # Set the directory local to the instance where the all build scripts and
  # configurations are stored.
  #INSTANCE_BUILD_ROOT='/root/instance-build'
  INSTANCE_BUILD_ROOT='/Users/maf058/Documents/_code/repos/github/mdfgit/docker-sandbox/centos/my_working_dir/instance/'
  # Set the directory where modules are stored relative to the instance build
  # root. For example, if the instance build root is `/root/instance-build` and
  # the modules root is `modules`, then the absolute path to the modules root
  # is `/root/instance-build/modules`.
  MODULES_ROOT='modules'
  # Create the instance build root. Also create its intermediary directories if
  # they do not exist with `-p`. This flag also makes these mkdir's idempotent;
  # no error will be reported if the instance build root directory already
  # exists.

  echo "PROVISIONING MODE"

  MODULE_BOOTSTRAP=( 'source_params.sh' )
  run_module 'seed' 'bootstrap'
  run_phases

  echo "$0 done at $( date )"
}

run_phases() {
  for ACTIVE_PHASE in ${PHASES[@]}; do
    run_phase ${ACTIVE_PHASE}
  done
}

run_phase() {
  local phase_name="${1}"
  for ACTIVE_MODULE in ${MODULES[@]}; do
    run_module ${phase_name} ${ACTIVE_MODULE}
  done
}

run_module() {
  local phase_name="${1}"
  local module_name="${2}"

  local unit_declaration="MODULE_$(echo ${module_name} | tr [:lower:] [:upper:])[@]"
  for ACTIVE_UNIT in "${!unit_declaration}"; do
    run_unit ${phase_name} ${module_name} ${ACTIVE_UNIT}
  done
}

run_unit() {
  local phase_name="${1}"
  local module_name="${2}"
  local unit_name="${3}"

  local hook_prefix="ib_"
  local hook="${hook_prefix}${phase_name}"

  UNIT_ROOT="${INSTANCE_BUILD_ROOT}/${MODULES_ROOT}/${module_name}"
  unset -f ${hook}
  source "${UNIT_ROOT}/${unit_name}"
  declare -F ${hook} && ${hook}
  unset -f ${hook}
}


main
