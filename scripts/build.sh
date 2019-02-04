#!/usr/bin/env bash

set -e -x

../ls -lrt

cur_version=$(cat ../../version-gist)

npm install

# Runnnig Unit Tests

npm run test
npm run test:coverage
npm run test:report

ls -lrt

tar -czvf ../dist/${cur_version}/cibuild.tar.gz --exclude='./node_modules' --exclude='./.git' --exclude='./.tmp' .

ls -lrt ../dist

# If build succeded push artifacts to nexus artifactory

cd ../dist

ls -lrt

cat ../version-gist

curl --upload-file *-${VERSION} -u admin:admin123 -v http://localhost:8081/repository/demo-app/
