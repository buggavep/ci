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
  if [[ $prev_version_gist == *"+"* ]]; then
    value=$(echo $prev_version_gist | rev | cut -d+ -f1)
  else
    value=0  
  fi 
  value=$(expr $value + 1)
  PACKAGE_VERSION="$PACKAGE_VERSION"+$value
  echo $PACKAGE_VERSION
fi

echo "v$PACKAGE_VERSION" > ../updated-gist/version-gist

ls -lrt

cd ../updated-gist
chmod 777 version-gist
ls -la

git config --global user.email "concourse@nobody.com"
git config --global user.name "concourse"
#git pull
git add .
git commit -m "Bumped release"

