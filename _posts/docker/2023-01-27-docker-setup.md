---
title: How to install Docker on Ubuntu 20.04
date: 2022-10-15 11:54:29 +/-TTTT
categories: [Docker]
tags: [Docker,Ubuntu,VM] # TAG names should always be lowercase
author: roberth
comments: false
---

## Install Docker

Update the system.

```sh
sudo apt-get update
```

Install required libraries.

```sh
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
```

Add Docker repository.

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
```

Add Repository to the system.

```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
```

Install Docker and Docker Compose.

```sh
sudo apt install -y docker-ce && sudo apt install docker-compose
```

Check that it's working properly.

```sh
sudo systemctl status docker
```

The output should look like this:

```sh
docker.service - Docker Application Container Engine 
Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled) 
Active: active (running) since Mon 2020-05-25 14:45:19 UTC; 1min 14s ago
Docs: https://docs.docker.com
Main PID: 856 (dockerd)
Tasks: 10
Memory: 42.8M
CPU: 209ms 
CGroup: /system.slice/docker.service 
        └─856 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

Create a simple container to test.

```sh
sudo docker run hello-world
```

## Install docker-compose

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```sh
sudo chmod +x /usr/local/bin/docker-compose
```

```sh
docker-compose --version
```

## Run Docker commands as non root user

```sh
sudo usermod -aG docker $USER && newgrp docker
```

Check to see if you can run a docker command as non root user

```sh
docker run hello-world
```