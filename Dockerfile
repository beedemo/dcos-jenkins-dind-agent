FROM beedemo/jenkins-dind-agent:1.13.1-compose1.13.0-jre8

LABEL maintainer "Kurt Madel <kmadel@cloudbees.com>"

COPY go-demo-unit-cache.tar /jenkins/go-demo-unit-cache.tar
COPY mongo.tar /jenkins/mongo.tar
