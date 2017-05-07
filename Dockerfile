FROM beedemo/jenkins-dind-agent:1.13.1-compose1.11.2-jre8

LABEL maintainer "Kurt Madel <kmadel@cloudbees.com>"

COPY go-demo-unit-cache.tar /jenkins/go-demo-unit-cache.tar
