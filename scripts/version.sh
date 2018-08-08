#!/usr/bin/env bash

set -e

ls -lrt

rm ../updated-gist/$GIST_NAME

git clone version-gist updated-gist 

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo $PACKAGE_VERSION

echo "$PACKAGE_VERSION" > version

mv version updated-gist

cd ../updated-gist

git config --global user.email "nobody@concourse.ci"
git config --global user.name "Concourse"
git add .
git commit -m "Bumped Release"