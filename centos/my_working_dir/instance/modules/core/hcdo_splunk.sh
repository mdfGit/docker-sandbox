#!/bin/bash
ib_defaults() {
	echo "hcdo_splunk.sh ib_defaults SPLUNK INDEX: ${SPLUNK_INDEX}"	
	SPLUNK_INDEX='cloud-huit-dms-dev'
	HCDO_SPLUNK_ROLE='hcdo-ansible-role-splunk'
	SPLUNK_CONF_DIR='/opt/splunkforwarder/etc/system/local'
	SPLUNK_APP_NAME="${APP}-${TIER}-${ENV}"

	HOST=$( uname -n )
	echo "defaults.sh ib_defaults SPLUNK INDEX: ${SPLUNK_INDEX}"	

	SPLUNK_INDEXER="splunk-s3-1-60ox.noc.harvard.edu"
	SPLUNK_PORT="50514"
	SPLUNK_MONITORS=(
	'/var/log'
	)
	LEGACY_MONITORS=(
	)
}

ib_init() {

  echo "hcdo_splunk.sh script started execution"
  echo "ib_init SPLUNK INDEX: ${SPLUNK_INDEX}"

  echo "HCDO_SPLUNK_ROLE: ${HCDO_SPLUNK_ROLE}"

  #Install and Configure Splunk
  echo "hcdo_splunk.sh completed successfully"
}