#!/usr/bin/env bash

set -e -x

ls -lrt

npm install

ls -lrt

tar -czvf ../dist/cibuild.tar.gz --exclude='./node_modules' --exclude='./.git' --exclude='./.tmp' .

curl -v -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} --upload-file angular.json http://10.0.0.101:9001/repository/maven-central/org/foo/1.0/foo-1.0.pom