#!/usr/bin/env bash

set -e

# BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git branch

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
# | awk '{print $2}')
echo $BRANCH

# if [ ${BRANCH} != "master" ]; then

echo $BRANCH

# fi


git clone ../version-gist ../updated-gist

rm -rf ../updated-gist/version-gist 

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')
echo "current package version:${PACKAGE_VERSION}"

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

