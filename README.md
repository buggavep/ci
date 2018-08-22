# setup concourse from the following link:
          https://concourse-ci.org/download.html

# Configure fly
          macosx : Install <fly executable path> /usr/lcoal/bin/

# Deploy pipeline
          fly -t <target> set-pipeline -c pipeline.yml -p <pipeline-name> -l <secretes-file>

# Sample secrets format

github-private-key: |
 
 -----BEGIN RSA PRIVATE KEY-----
 
 -----END RSA PRIVATE KEY-----

cf-endpoint: <>
cf-organization: <>
cf-space: <>
cf-username: <>
cf-password: <>


