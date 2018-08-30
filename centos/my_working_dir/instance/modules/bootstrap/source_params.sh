#!/usr/bin/env bash

ib_seed() {
  source ${UNIT_ROOT}/lib.sh

  PHASES=(
    'init'
    'config'
  )
  TIERS=(
    'app'
  )
  MODULES=(
    'bootstrap'
    #'environment'
    'utils'
    'core'
    #'middleware'
    #'awslinux'
    #'redhat'
    #'supplemental'
    #'oracle'
  )
  MODULE_ENVIRONMENT=(
  )
  MODULE_UTILS=(
    'yum_utils_packages.sh'
  )
  MODULE_CORE=(
    #'etc_hosts.sh'
    #'hcdo_repo_setup.sh'
    #'oldest_instance.sh'
    #'tag_volumes.sh'
    #'sethostname.sh'
    #'hcdo_splunk.sh'
    #'setswap.sh'
  )
  MODULE_MIDDLEWARE=()
  MODULE_AWSLINUX=()
  MODULE_REDHAT=(
    #'rhel_satellite.sh'
    #'cfn_bootstrap.sh'
  )
  MODULE_ORACLE=(
    #'oracle_install.sh'
    #'oracle_dbprotect_agent.sh'
    #'oracle_maestro_client.sh'
    #'oracle_oem_agent.sh'
    #'oracle_base.sh'
  )
  MODULE_SUPPLEMENTAL=(
    #'namedAccounts.sh'
    #'nessus.sh'
    #'crowdstrike.sh'
    #'ssm.sh'
    #'codedeploy.sh'
  )
  ENVIRONMENTS=(
    'sand*:::sand'
    'dev*:::dev'
    'auto*:::auto'
    'test*:::test'
    'int*:::int'
    'stag*:::stage'
    'prod*2:::prod2'
    'prod*:::prod'
  )

  ENV=sand
  echo "Setting ENV=sand"

  local cloudenv_file='/etc/profile.d/cloud-env.sh'
  local env_formal=env_formal
  local tier_actual=tier

  local cloudenv_template="\
  export APP='product'
  export APP_INSTANCE='APP_INSTANCE'
  export ENV='${ENV}'
  export TIER='$(lowercase ${tier_actual})'
  export BUCKET_NAME='bucket'
  export INSTANCE_BUILD_ROOT=${INSTANCE_BUILD_ROOT}
  export INSTANCE_ID='instance'
  export PRODUCT_NAME='pn'
  export PRODUCT_ENV_SHORT_NAME='pesn'
  export PRODUCT_DOMAIN_NAME='pdn'
  export BUCKET_PRODUCT_NAME='bpn'"

  echo "${cloudenv_template}" > ${cloudenv_file}

  source ${cloudenv_file}

  run_module 'init' 'bootstrap'
  run_phase 'defaults'
}

# ib_defaults() {}

ib_init() {
  echo "source_params.sh script started execution"
  # Set the file users edit to manipulate the behavior of the instance build
  # process.
  #echo "source defaults.sh"
  #source ${UNIT_ROOT}/defaults.sh

  local config="${INSTANCE_BUILD_ROOT}/env_specific.sh"
  source ${config}
  #env_specific
  echo "source_params.sh script completed successfully"
}

# ib_config() {}