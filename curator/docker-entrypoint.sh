#!/bin/bash
set -e

: "${ES_HOST:?ES_HOST needs to be set}"
: "${DRYRUN:?DRYRUN needs to be set}"
: "${CONFIG_FILE:?CONFIG_FILE needs to be set}"
: "${INTERVAL_IN_HOURS:?INTERVAL_IN_HOURS needs to be set}"


if [ "${DRYRUN}" != 'FALSE' ]
then
  OPTIONS='--dry-run'
fi


if [ "$1" = 'curator-job' ]
then
  while true
  do
    # curator can only run action file -> loop over action files
    for file in /app/actions/*
    do
      curator --config /app/conf/${CONFIG_FILE} ${OPTIONS} ${file}
    done
    set -e
    sleep $(( 60*60*INTERVAL_IN_HOURS ))
    set +e
  done
else
  exec "$@"
fi
