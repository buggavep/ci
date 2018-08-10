#!/usr/bin/env bash

set -e -x

ls -lrt

npm install

ls -lrt

tar -czvf ../dist/cibuild.tar.gz --exclude='./node_modules' --exclude='./.git' --exclude='./.tmp' .

curl -u${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} -T ../dist/cibuild.tar.gz "http://10.0.0.101:9001/repository/maven-snapshots/"