#!/usr/bin/env bash

set -e -x

ls -lrt

export TERM=dumb

chmod -R 777 *

npm install

ls -lrt
