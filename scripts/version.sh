#!/usr/bin/env bash

set -e

ls -lrt

git clone resource-gist updated-gist

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')

echo $PACKAGE_VERSION > ../updated-gist/version
echo "current package version:${PACKAGE_VERSION}"
#cd ..
ls -la
touch version
chmod 777 version
ls -la
#echo $(date) > version
echo "$PACKAGE_VERSION" > version
git config --global user.email "nobody@concourse.ci"
git config --global user.name "Concourse"
git add .
git commit -m "Bumped Release"


