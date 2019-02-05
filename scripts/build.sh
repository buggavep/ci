#!/bin/sh

set -e -x

ls -lrt

#To create artifact with version
cur_version=$(cat ../version-gist/version-gist)

npm install

# Runnnig Unit Tests

npm run test
npm run test:coverage
npm run test:report

ls -lrt

tar -czvf ../dist/cibuild.tar.gz --exclude='./node_modules' --exclude='./.git' --exclude='./.tmp' .

ls -lrt ../dist

# If build succeded push artifacts to nexus artifactory

cd ../dist

chmod 744 cibuild.tar.gz
ls -lart

# curl --silent  -v --upload-file cibuild.tar.gz -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} ${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz > /dev/null 2>&1

curl --silent  -v --upload-file cibuild.tar.gz setapikey 2dbc26c9-6c83-3887-9b04-3d98e90159b1 ${NEXUS_HOST}/repository/demo-files/${cur_version}/cibuild.tar.gz > /dev/null 2>&1