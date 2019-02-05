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

chmod 777 .
ls -lrt

# npm publish -u admin:admin123  --registry http://localhost:8081/repository/npm-internal/cibuild.tar.gz
# curl -V --upload-file cibuild.tar.gz -u admin:admin123 -v http://172.17.17.104:8081/repository/demo-app/${cur_version}
curl -v --upload-file cibuild.tar.gz -u admin:admin123 -v http://127.0.0.1:8081/repository/demo-app