#!/usr/bin/env bash

set -e

ls -lrt

git clone version-gist ../updated-gist

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')
echo "current package version:${PACKAGE_VERSION}"
#cd ..
ls -la
touch version
chmod 777 version
ls -la
#echo $(date) > version
echo "$PACKAGE_VERSION" > version

ls -lrt

cd ../updated-gist
mv ../version ../updated-gist

ls -la

git config --global user.email "nobody@nobody.com"
git config --global user.name "nobody"
#git pull
git add version
git commit -m "Bumped release"

