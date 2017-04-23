# Jenkins Docker-in-Docker Agent
[![Docker Stars](https://img.shields.io/docker/stars/beedemo/jenkins-dind-agent.svg)][docker-hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/beedemo/jenkins-dind-agent.svg)][docker-hub]
[![](https://images.microbadger.com/badges/image/mesosphere/jenkins-dind.svg)](http://microbadger.com/images/beedemo/jenkins-dind-agent "Get your own image badge on microbadger.com")

A simple Docker image for running a Jenkins agent with its very
own contained Docker daemon (aka DIND). This is useful if you're trying to run Jenkins agents as a Docker container, and you also want to use Docker without some of the side effects of mounting the Docker socket OR you need to use a specific version of Docker not available from agent host.


## Usage
### Command line
Try it out locally by running the following command:

```bash
docker run --privileged beedemo/jenkins-dind-agent \
  wrapper.sh "java -version && docker run hello-world && docker-compose -v"
```

### CloudBees Jenkins Enterprise Palace Docket Agent Template Configuration
More information coming soon...

[docker-hub]: https://hub.docker.com/r/beedemo/jenkins-dind-agent
