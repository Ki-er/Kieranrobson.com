---
title: "How to install Docker and Docker Compose"
date: 2022-05-28T16:17:00
tags: ["Docker Compose", "Docker"]
categories: ["Guides"]
description: "How to install Docker and Docker Compose"
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
---

[Docker](https://docs.docker.com/get-started/overview/) is a set of platform as a service [(PAAS)](https://azure.microsoft.com/en-gb/overview/what-is-paas/) products that use OS-level virtualization to deliver software in packages called containers. 

## Dependencies

Update the system
```bash
sudo apt update
```

## Docker Install
Install docker
```bash
sudo apt install docker.io
```

To check whether docker has installed correctly, run the following command
```bash
sudo docker -v
```

```
`Docker version 20.10.12, build 20.10.12-0ubuntu2~20.04.1
```

To run docker containers the `docker run` command is used
```bash
docker run hello-world
```

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:6a65f928fb91fcfbc963f7aa6d57c8eeb426ad9a20c7ee045538ef34847f44f1
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
```


## Docker Compose Install
Install docker-compose
```bash
sudo apt install docker-compose
```

### Setting up a `docker-compose.yml` file
```bash
mkdir example
cd example
```
```bash
touch docker-compose.yml
nano  docker-compose.yml
```
Below is the docker compose file for setting up nginx proxy manager as an example.
```yaml                                                                                                  
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
To run the docker-compose.yml file and make it into a container, the follwing command can be run:
```bash
docker-compose up -d 
```
The `--force-create flag can be added to remake the container
```bash
docker-compose up -d --force-create
```

To check the status of containers `docker ps` can be run.