#!/usr/bin/env bash

set -e -x

ls -lrt
cur_version=$(cat ../version-gist/version-gist)

curl -O ${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz

ls -lrt

export TERM=dumb

chmod -R 777 *

# npm install

ls -lrt
