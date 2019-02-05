#!/usr/bin/env bash

set -e -x

ls -lrt

curl -X GET -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} ${NEXUS_HOST}/repository/demo-files/${cur_version}/*

ls -lrt

export TERM=dumb

chmod -R 777 *

# npm install

ls -lrt
