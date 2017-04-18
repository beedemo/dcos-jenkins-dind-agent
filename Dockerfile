FROM beedemo/jenkins-dind-agent:1.13.1-jdk8

MAINTAINER Kurt Madel <kmadel@cloudbees.com>

RUN pip install docker-compose==1.12.0
