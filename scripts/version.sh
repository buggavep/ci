#!/usr/bin/env bash

set -e

ls -lrt

echo "**********build number is"
echo $BUILD_NAME
echo $BUILD_PIPELINE_NAME
echo $BUILD_JOB_NAME

git clone ../version-gist ../updated-gist

rm -rf ../updated-gist/version-gist 

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')
echo "current package version:${PACKAGE_VERSION}"

ls -la

echo "$PACKAGE_VERSION" > ../updated-gist/version-gist

ls -lrt

cd ../updated-gist
chmod 777 version-gist
ls -la

git config --global user.email "nobody@nobody.com"
git config --global user.name "nobody"
#git pull
git add .
git commit -m "Bumped release"

