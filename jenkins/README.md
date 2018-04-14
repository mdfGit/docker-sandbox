
### Getting started

* Get the Jenkins image from here: https://github.com/jenkinsci/docker/blob/master/README.md

```
docker pull jenkins/jenkins
```

either... This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuratioeither... 

```
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

... or with explicit volume so you can manage it and attach to another container for upgrades

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts


```
