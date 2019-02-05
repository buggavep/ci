#!/usr/bin/env bash

set -e -x

cur_version=$(cat ../version-gist/version-gist)

# curl -O ${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz

curl -K -L "${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz" | tar -xvzf -

cf login -a ${CF_API_ENDPOINT} -u ${CF_USERNAME} -p ${CF_PASSWORD} -o ${CF_ORG} -s ${CF_SPACE} >/dev/null 2>&1

cf push ${APP_NAME}