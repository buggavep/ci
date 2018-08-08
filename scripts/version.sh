#!/usr/bin/env bash

set -e

ls -lrt

git clone ../version-gist ../updated-gist

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')
echo "current package version:${PACKAGE_VERSION}"
#cd ..
ls -la

echo $BUILD_ID

if [ "$ENVIRONMENT" == "production" ]; then
   
   echo "$PACKAGE_VERSION" > ../updated-gist/version-gist

else

   echo "$PACKAGE_VERSION" > ../updated-gist/version-gist

fi

ls -lrt

cd ../updated-gist
chmod 777 version-gist
ls -la

git config --global user.email "nobody@nobody.com"
git config --global user.name "nobody"
#git pull
git add .
git commit -m "Bumped release"

