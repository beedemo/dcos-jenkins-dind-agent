pipeline {
  options { 
    //only keep logs for 5 runs
    buildDiscarder(logRotator(numToKeepStr: '5')) 
  }
  agent {
    //we need Docker
    label "docker"
  }
  environment {
    //these will be used throughout the Pipeline
    DOCKER_HUB_USER = 'beedemo'
    DOCKER_REGISTRY = 'localhost:31095'
  }
  stages {
    stage("Build and Push Image") {
      steps {
        //pull and save images to include in dind agent
        sh "docker pull ${DOCKER_HUB_USER}/go-demo:unit-cache && docker save -o go-demo-unit-cache.tar ${DOCKER_HUB_USER}/go-demo:unit-cache"
        //build image
        sh "docker build -t ${DOCKER_REGISTRY}/${DOCKER_HUB_USER}/dind-compose-agent:go-demo ."
        //push to registry
        sh "docker push ${DOCKER_REGISTRY}/${DOCKER_HUB_USER}/dind-compose-agent:go-demo"
      }
    }
}