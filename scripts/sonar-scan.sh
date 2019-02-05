#!/bin/sh

#Running sonar-scanner for code quality

sonar-scanner \
  -Dsonar.projectKey=Demo \
  -Dsonar.sources=. \
  -Dsonar.host.url=${SONAR_HOST}\
  -Dsonar.login=${SONAR_TOKEN}