#!/usr/bin/bash

ib_defaults() {
  echo "yum_utils_packages.sh ib_defaults SPLUNK INDEX: ${SPLUNK_INDEX}"  

  YUM_UTILS_PKGS=(
    'git'
    'ntp'
    'tmux'
    'unzip'
    'wget'
    'telnet'
  )
}

ib_init() {
  echo "yum_utils_packages.sh started execution"

  echo "yum_utils_packages.sh ib_init SPLUNK INDEX: ${SPLUNK_INDEX}"  

  # Install arbitrary packages with yum
  yum -y install ${YUM_UTILS_PKGS[@]}
  echo "yum_utils_packages.sh completed successfully"
}
