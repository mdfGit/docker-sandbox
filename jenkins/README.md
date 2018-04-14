
### Getting started

* Get the Jenkins image from here: https://github.com/jenkinsci/docker/blob/master/README.md

```
docker pull jenkins/jenkins
```

The folowing will start and store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration... 

```
docker run --name myjenkinscontainer -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```

... or start with explicit volume so you can manage it and attach to another container for upgrades.  This will automatically create a 'jenkins_home' volume on docker host, that will survive container stop/restart/deletion.  When you use a volume, a new directory is created within Docker’s storage directory on the host machine, and Docker manages that directory’s contents.  If your volume is inside a container - you can use
``` 
docker cp $CONTAINERID:/var/jenkins_home TARGETDIRECTORY
```
command to extract the data for backups on the host machine,  Treat it like a database.

```
docker run --name myjenkinscontainer -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```

...or, if you want a terminal interface (to fetch the password)
```
TODO: this doesn't seem to run as expected, probably want to run it as -d background daemon anyway
docker run -itp 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts /bin/bash
```

Then goto http://localhost:8080

Each of the commands above will create a new container... you want to create a container  once, then use:
```
docker start CONTAINERID 
```

Stop the container when done using it
```
docker stop CONTAINERID
```

View all containers and their status
```
docker ps -a
```

Delete unwanted extra containers
```
docker rm CONTAINERID
```

To open an ssh prompt on a running docker instance
```
docker exec -i -t CONTAINERID /bin/bash
```

To run a certain command from the host to the container, optionally choose the working directory -w and issue relative command e.g. list the active directory
```
docker exec --privileged -i -t -w /var/jenkins_home/jenkins_home 970c256f9003 ls -lstra
```



