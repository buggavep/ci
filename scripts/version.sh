#!/usr/bin/env bash

set -e
PACKAGE_VERSION=0
export BRANCH=$(git branch | sed -n 2p)
 
git clone ../version-gist ../updated-gist

prev_version_gist=$(cat ../updated-gist/version-gist)

rm -rf ../updated-gist/version-gist 

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')

if [ ${BRANCH} != "master" ]; then
  echo  "current branch is:" $BRANCH 
  echo  "previous version:" $prev_version_gist
  #PACKAGE_VERSION=$((${PACKAGE_VERSION}+1))
  value=$(echo $prev_version_gist | rev | cut -d+ -f1)
  value=$(expr $value + 1)
  PACKAGE_VERSION="v$PACKAGE_VERSION"+$value
  echo $PACKAGE_VERSION

fi

echo "$PACKAGE_VERSION" > ../updated-gist/version-gist

ls -lrt

cd ../updated-gist
chmod 777 version-gist
ls -la

git config --global user.email "concourse@nobody.com"
git config --global user.name "concourse"
#git pull
git add .
git commit -m "Bumped release"

