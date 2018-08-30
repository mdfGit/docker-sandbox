#!/usr/bin/env bash

lowercase() {
  echo "${1}" | tr '[:upper:]' '[:lower:]'
}

uppercase() {
  echo "${1}" | tr '[:lower:]' '[:upper:]' 
}

array_search() {
  # arg1: needle
  # arg2: haystack
  local element
  for element in ${@:2}; do
    if [[ $element == $1 ]]; then
      return 0
    fi
  done
  return 1
}

mount_devices() {
  local mount
  for mount in $@; do
    mount_device ${mount//:::/ }
  done
}

mount_device() {
  # Second, save the piece before ':::', this is the name of the unit
  local device_name=$1
  local mount_point=$2

  if ! [ -n "$1" ]
  then
    echo "device_name parameter empty - return 1"
    return 1
  fi

  if ! [ -n "$2" ] 
  then
    echo "mount_point parameter empty - return 1"
    return 1
  fi

  # Create mount point
  mkdir -p $mount_point

  # Create filesystem
  local fscheck=""
  local fscheck=$(file -s $device_name)
  if [[ ${fscheck} == *data* ]] || [[ ${fscheck} == *PGP* ]] || [[ ${fscheck} == *relocatable* ]] || [[ ${fscheck} == *stripped* ]]
  then
    mkfs -t xfs "$device_name"
  fi

  # Update the fstab with the new volume
  echo "$device_name       $mount_point   xfs    defaults,nofail        0       2" >> /etc/fstab

  # Mount the folume
  if ! mount $mount_point
  then
    echo "Mount Failed!"
    return 1
  fi
}
