#!/usr/bin/env bash

set -e -x

cur_version=$(cat ../version-gist/version-gist)

# curl -O ${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz

curl -K -L "${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz" | tar -xvzf -


export TERM=dumb

chmod -R 777 *

# npm install

ls -lrt
