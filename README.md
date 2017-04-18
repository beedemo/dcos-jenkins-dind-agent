# Jenkins Docker-in-Docker Agent
[![Docker Stars](https://img.shields.io/docker/stars/beedemo/jenkins-dind-agent.svg)][docker-hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/beedemo/jenkins-dind-agent.svg)][docker-hub]
[![](https://images.microbadger.com/badges/image/mesosphere/jenkins-dind.svg)](http://microbadger.com/images/beedemo/jenkins-dind-agent "Get your own image badge on microbadger.com")

A simple Docker image for running a Jenkins agent with its very
own contained Docker daemon. This is useful if you're trying to run Jenkins agents on a
Mesos cluster, and you also want to build and push Docker images with Jenkins agents.


## Usage
### Command line
Try it out locally by running the following command:

```bash
docker run --privileged beedemo/jenkins-dind-agent \
  wrapper.sh "java -version && docker run hello-world"
```

### Jenkins
You'll need to configure the Mesos plugin on your Jenkins master to use this
image. You'll probably also want to give it a special slave label, so that you
don't unnecessarily run builds using the dind image. A relevant snippet of the
Mesos plugin within the Jenkins master's `config.xml` follows:

```xml
<org.jenkinsci.plugins.mesos.MesosSlaveInfo>
  <slaveCpus>0.2</slaveCpus>
  <slaveMem>512</slaveMem>
  <executorCpus>0.1</executorCpus>
  <maxExecutors>2</maxExecutors>
  <executorMem>128</executorMem>
  <remoteFSRoot>jenkins</remoteFSRoot>
  <idleTerminationMinutes>3</idleTerminationMinutes>
  <jvmArgs>
    -Xms16m -XX:+UseConcMarkSweepGC -Djava.net.preferIPv4Stack=true
  </jvmArgs>
  <jnlpArgs/>
  <containerInfo>
    <type>DOCKER</type>
    <dockerImage>beedemo/jenkins-dind-agent:1.13.1-alpine</dockerImage>
    <networking>BRIDGE</networking>
    <useCustomDockerCommandShell>true</useCustomDockerCommandShell>
    <customDockerCommandShell>wrapper.sh</customDockerCommandShell>
    <dockerPrivilegedMode>true</dockerPrivilegedMode>
    <dockerForcePullImage>false</dockerForcePullImage>
  </containerInfo>
  <mode>NORMAL</mode>
  <labelString>dind</labelString>
</org.jenkinsci.plugins.mesos.MesosSlaveInfo>
```

[docker-hub]: https://hub.docker.com/r/beedemo/jenkins-dind-agent
