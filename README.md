# KICK START You CICD Setup.

# This Project is created to help you with the basic setup of Concourse Pipelines. How to configure Jobs and What are the necessary jobs that can be intergated to Continously deploy your product on to pcf.

# CI-CD Basic Architecture

 ![CI-CD Basic Architecture](/docs/Basic-Architecture.png)

# Setup Concourse from the following link:
        git clone https://github.com/buggavep/ci.git
        
        1. cd ci/
        2. Edit docker-compose.yml file (Edit Concourse Username and Concourse Password). 
        RUN docker-compose up -d.
        
# If docker is not configured then follow the steps below:
        https://docs.docker.com/docker-for-mac/install/
              
# Configure fly
          macosx : Install <fly executable path> /usr/lcoal/bin/
                   fly -t <target> login -c <pipeline-url>

# Deploy Pipeline
          RUN git clone https://github.com/buggavep/ci.git
          
          RUN cd ci
            
          RUN fly -t <target> set-pipeline -c pipeline.yml -p <pipeline-name> -l <secretes-file>

# Sample Secrets-file Format
          app-name: {{value}}
          cf-api-endpoint: {{value}}
          cf-username: {{value}}
          cf-password: {{value}}
          cf-org: {{value}}
          cf-space: {{value}}
          nexus-username: {{value}}
          nexus-password: {{value}}
          nexus-host: {{value}}
          sonar-host: {{value}}
          sonar-token: {{value}}
          github-private-key: |
           -----BEGIN RSA PRIVATE KEY-----

           -----END RSA PRIVATE KEY-----
           
# Integrations
1. GitHub.   
2. Docker.
3. Nexus Artifactory.
   Configurations:
     1. Download Nexus from the following link: https://help.sonatype.com/repomanager3/download/download-archives---repository-manager-3
     2. Unzip the artifact.
     3. Update the ip address in nexus.properties files.
             application-port=8081
             application-host=0.0.0.0
     4. RUN ./PATH/TO/BIN/nexus start.
     
4. SonarQube Scanner.
   Configurations:
     1. Download Sonarqube from the following link: https://www.sonarqube.org/downloads/
     2. Unzip the artifact
     3. Udpate the ip address and port in sonar.properties files.
             sonar.web.host=
             sonar.web.port=
     4. RUN ./PATH/TO/BIN/sonar start
     
5. Pivotal Cloud Foundary.
     1. Login to: https://run.pivotal.io/
     2. Create Account.
     3. Create ORG and SPACE.
