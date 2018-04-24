

Note: Dockerfile currently not used...

## Create New Centos Container w/Auto Sync of the Current Directory and run bash 

```
docker run --name my_centos_image -v `pwd`:`pwd` -w `pwd` -it  centos bash
```

## Docker Start Existing Container 
Since the original container has volume sync, adding new file/folders autosyncs in real time in both directions
```
docker start my_centos_image
```

## Docker Bash Interface on Running Container

```
docker exec -i -t my_centos_image /bin/bash
```

## Link to Common Commands
