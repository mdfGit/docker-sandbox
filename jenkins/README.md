
### Getting started

* Get the Jenkins image from here: https://github.com/jenkinsci/docker/blob/master/README.md

```
docker pull jenkins/jenkins
```

The folowing will start and store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuratioeither... 

```
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

... or start with explicit volume so you can manage it and attach to another container for upgrades.  This will automatically create a 'jenkins_home' volume on docker host, that will survive container stop/restart/deletion.  When you use a volume, a new directory is created within Docker’s storage directory on the host machine, and Docker manages that directory’s contents.  If your volume is inside a container - you can use docker cp $ID:/var/jenkins_home command to extract the data for backups on the host machine,  Treat it like a database.

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```

...or, if you want a terminal interface
```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

Then goto http://localhost:8080

Note: each of the commands above will create a new container... you want to create a container  once, then use:
```
docker start CONTAINERID 
```

Delete unwanted extra containers
```
docker rm CONTAINERID
```

To open an ssh prompt on a running docker instance
```
docker exec -i -t CONTAINERID /bin/bash
```



