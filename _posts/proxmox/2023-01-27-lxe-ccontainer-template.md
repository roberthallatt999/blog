---
title: How to create a container (LXE) template running Ubuntu 20.04
date: 2022-10-15 11:54:29 +/-TTTT
categories: [Proxmox]
tags: [Proxmox,Ubuntu,LXE] # TAG names should always be lowercase
author: roberth
comments: false
---

## Upgrade the system packages.

```sh
sudo apt update && sudo apt dist-upgrade
```

## Clean up the container (optional)

```sh
sudo apt clean && sudo apt autoremove
```

## Add a new user.

```sh
adduser {your username}
```

## Configure SSH.

Change to /etc/ssh directory.

```sh
cd /etc/ssh
```

Clear out the host keys (make sur eyou stay logged in).

```sh
sudo rm ssh_host_*
```

## Make the machine ID unique. First check that it exists (it will show up as a string of characters).

```sh
cat /ect/machine-id
```

Clear it out.

```sh
sudo truncate -s 0 /etc/machine-id
```

## Shut down the container.

```sh
sudo powerdown
```

In Proxmox, right click on container and convert container to a template.

Start it up and use the console to login and run the following command.

```sh
sudo dpkg-reconfigure openssh-server
```

Then, in a terminal, try to ssh into the container.

```sh
ssh {your_username}@{your_ip}
```
<br />
> You can get the IP of your container from the console in Proxmox by running:
>
> ```sh
> ip a
>```
>
{: .prompt-info }