#!/usr/bin/env bash

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

ls -lrt

curl --upload-file cibuild.tar.gz -u ${NEXUS-USERNAME}:${NEXUS-PASSWORD} -v ${NEXUS-HOST}/${cur_version}