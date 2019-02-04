#!/usr/bin/env bash

set -e
# PACKAGE_VERSION=0
# export BRANCH=$(git branch | sed -n 2p)
 
git clone ../version-gist ../updated-gist

# prev_version_gist=$(cat ../updated-gist/version-gist)

# prev_version=$(echo $prev_version_gist | sed "s/.*://")
# echo $prev_version
rm -rf ../updated-gist/version-gist 

PACKAGE_VERSION=$(cat package.json \
| grep version \
| head -1 \
| awk -F: '{ print $2 }' \
| sed 's/[",]//g' \
| tr -d '[[:space:]]')

# chmod 777 ../ci/scripts/release.sh
# ../ci/scripts/release.sh $PACKAGE_VERSION

# git tag v$PACKAGE_VERSION

#git push origin --tags

# if [ ${BRANCH} != "master" ]; then
#   echo  "current branch is:" $BRANCH 
#   echo  "previous version:" $prev_version_gist
#   if [[ $prev_version_gist == *"+"* ]]; then
#     value=$(echo $prev_version_gist | rev | cut -d+ -f1)
#   else
#     value=0  
#   fi 
#   value=$(expr $value + 1)
#   if [ $PACKAGE_VERSION == $prev_version ]; then
#     PACKAGE_VERSION="$PACKAGE_VERSION"+$value
#   else
#   	PACKAGE_VERSION="$PACKAGE_VERSION"
#   fi 
# fi

# echo "Updated Version:" $PACKAGE_VERSION
# if [ $(git tag -l "$PACKAGE_VERSION") ]; then
#     echo yes
# else
#     echo no
#     git tag $PACKAGE_VERSION
#     git config --global user.email "concourse@nobody.com"
#     git config --global user.name "concourse"
#     git push origin --tags
# fi

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

