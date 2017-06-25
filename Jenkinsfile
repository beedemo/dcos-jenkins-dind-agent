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
    DOCKER_CREDENTIAL_ID = 'docker-hub-beedemo'
    DOCKER_LOCAL_REGISTRY = 'localhost:31095'
  }
  stages {
    stage("Build and Push Image") {
      steps {
        //pull and save images to include in dind agent
        sh "docker pull ${DOCKER_HUB_USER}/go-demo:unit-cache && docker save -o go-demo-unit-cache.tar ${DOCKER_HUB_USER}/go-demo:unit-cache"
        sh "docker pull mongo:3.2.10 && docker save -o mongo.tar mongo:3.2.10"
        //build image
        sh "docker build -t ${DOCKER_HUB_USER}/dind-compose-agent:go-demo ."
        //tag to allow pushing to both local registry and Docker Hub""
        sh "docker tag ${DOCKER_HUB_USER}/dind-compose-agent:go-demo ${DOCKER_LOCAL_REGISTRY}/${DOCKER_HUB_USER}/dind-compose-agent:go-demo"
        //push to registry
        sh "docker push ${DOCKER_LOCAL_REGISTRY}/${DOCKER_HUB_USER}/dind-compose-agent:go-demo"
        //also push to public registy - Docker Hub
        //dockerBuildPush params: org, name, tag, dir, pushCredId
        dockerBuildPush("${DOCKER_HUB_USER}", "dind-compose-agent", "go-demo", ".", "${DOCKER_CREDENTIAL_ID}")
      }
    }
  }
}