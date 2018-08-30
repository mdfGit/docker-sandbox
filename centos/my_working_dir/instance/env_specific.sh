#!/usr/bin/env bash

env_specific() {
  # Nessus is part of the HUIT Base MVP and as such will be configured for all
  # products and environments.
  NESSUS_GROUP=HDW

  MODULE_CORE=(
    #'etc_hosts.sh'
    #'hcdo_repo_setup.sh'
    #'oldest_instance.sh'
    #'tag_volumes.sh'
    #'sethostname.sh'
    'hcdo_splunk.sh'
    #'setswap.sh'
  )

  RHEL_ACTIVATION_KEY='2-rhel-7'

  case "${ENV}" in
    sand)
      SPLUNK_INDEX='cloud-huit-dms-sand'
      ;;
    dev)
      SPLUNK_INDEX='cloud-huit-dms-dev'
      ;;
    test)
      SPLUNK_INDEX='cloud-huit-dms-test'
      ;;
    int)
      SPLUNK_INDEX='cloud-huit-dms-test'
      ;;
    stage)
      SPLUNK_INDEX='cloud-huit-dms-test'
      ;;
    train)
      SPLUNK_INDEX='cloud-huit-dms-prod'
      ;;
    prod)
      SPLUNK_INDEX='cloud-huit-dms-prod'
      
      MODULE_ORACLE=(
        #'oracle_install.sh'
        #'oracle_dbprotect_agent.sh'
        #'oracle_maestro_client.sh'
        #'oracle_oem_agent.sh'
        #'oracle_base.sh'
      )

      ;;
  esac

  echo "ENV_SPECIFIC.sh SETTING SPLUNK_INDEX: ${SPLUNK_INDEX}"

}

###############################################################################

java_pattern() {
  # set this in env_specific() above, example included here
  # TOMCAT_JVM_OPTIONS='-Xms512m -Xmx1024m -Duser.timezone=America/New_York'
  MODULE_MIDDLEWARE=(
    'java.sh'
    'tomcat.sh'
    'java_self_signed_cert.sh' # optional depending on your needs
  )
}

perl_pattern() {
  :
}

env_specific
