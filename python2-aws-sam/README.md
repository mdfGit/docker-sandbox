
### Deprecated not using

aws-sam-cli creates a docker-lambda image to be used

### Getting started

* Get the python:2 instructions from here: https://hub.docker.com/_/python/

Create Dockerfile to install aws-sam-cli

```
FROM python:2
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# Install aws-sam-cli
RUN pip install aws-sam-cli
```

Build an image from the Dockerfile and set the repository:tag 'python2-aws-sam'
(if making updates, python2-aws-sam:v2' etc...)

```
docker build -t python2-aws-sam .
```

List all images 

```
docker images -a
```

Delete unwanted extra images
```
docker rmi IMAGEID
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

To open an ssh prompt in a new docker instance
```
docker run -i -t CONTAINERID /bin/bash
```

You can use the repository name found in docker images

```
docker run -i -t python2-aws-sam:latest /bin/bash
```

Create a Sample app, creates directory sam-app

```
sam init --runtime python
```

