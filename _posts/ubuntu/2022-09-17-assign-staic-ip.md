---
title: How to assign a static IP to an Ubuntu 20.04 server
date: 2022-10-15 11:54:29 +/-TTTT
categories: [Ubuntu]
tags: [Linux,Ubuntu] # TAG names should always be lowercase
author: roberth
comments: false
---

Follow these steps to assign static IP to Ubuntu server.

If the server was provisioned with CloudInit, do the following first. The filename may vary.

```sh
sudo cat /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
```

and make sure it is set to disabled

```sh≠
network: {config: disabled}
```
{: file="subiquity-disable-cloudinit-networking.cfg" }

Next, you should run the following command to figure out what your nic is and make a note of it because you will need this information when we change the network config.

```sh

ip link

```

Now we need to edit the network config

```sh
sudo nano /etc/netplan/00-installer-config.yaml
```

And change it to the below. Make sure to update the nic id. The nic id in the code below is ens3.

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.2.xxx/24
      routes: 
      - to: default
        via: 192.168.2.1
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]
```
{: file="00-installer-config.yaml  " }

Now apply the changes

```sh

sudo netplan apply

```

Verify the change

```sh

ip addr show dev ens3

```