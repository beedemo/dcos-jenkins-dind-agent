FROM beedemo/jenkins-dind-agent:1.13.1-jre8

MAINTAINER Kurt Madel <kmadel@cloudbees.com>

RUN set -x \
    && apk add --no-cache \
        py-pip

RUN pip install docker-compose==1.11.2
