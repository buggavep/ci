#!/usr/bin/env bash

set -e -x

ls -lrt

npm install

ls -lrt

tar -czvf ../dist/cibuild.tar.gz --exclude='./node_modules' --exclude='./.git' --exclude='./.tmp' .

ls -lrt ../dist

# curl -uadmin:AP55xy9re8GhbxvFzY1ANhbvKhA -T ../dist/cibuild.tar.gz "http://10.0.0.101:8081/artifactory/example-repo-local/version/"

# curl -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} --upload-file ../dist/* http://10.0.0.101:9001/nexus/content/repositories/version/
