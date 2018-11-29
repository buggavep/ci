# setup concourse from the following link:
          https://concourse-ci.org/download.html

# Configure fly
          macosx : Install <fly executable path> /usr/lcoal/bin/

# Deploy pipeline
          command line:
          
          RUN git clone https://github.com/buggavep/ci.git
          
          RUN cd ci

          RUN fly -t <target> set-pipeline -c pipeline.yml -p <pipeline-name> -l <secretes-file>

# Sample secrets-file format

github-private-key: |
 
 -----BEGIN RSA PRIVATE KEY-----
 
 -----END RSA PRIVATE KEY-----

cf-endpoint: $cf-endpoint
cf-organization: $cf-organization
cf-space: $cf-space
cf-username: $cf-username
cf-password: $cf-password


