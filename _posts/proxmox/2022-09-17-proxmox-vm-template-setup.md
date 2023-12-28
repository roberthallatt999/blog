---
title: How to create a VM template for Ubuntu 20.04
date: 2022-10-15 11:54:29 +/-TTTT
categories: [Proxmox]
tags: [Proxmox,Ubuntu,VM] # TAG names should always be lowercase
author: roberth
comments: false
---

This post is a guide on how to convert any VM into a template that can be used to clone new servers.

## Control panel config

1. Hardware > CD/DVD Drive (ide2) > edit and select "do not use any media"
2. Hardware > Add > CloudInit Drive (needed for cloning to work)
3. Options > QEMU Guest Agent. Click on Edit and check "Use QENU Guest Agent".
4. Options > Start at boot. Click on Edit and check box.
5. Cloud-Init and change user and password options. 

## Update system and set-up QEMU agent

```sh
sudo apt update && sudo apt dist-upgrade

sudo apt install qemu-guest-agent

sudo systemctl start qemu-guest-agent.service

systemctl status qemu-guest-agent.service
```

## Make sure cloud-init is installed

```sh
apt search cloud-init
```

## Clear out host keys

```sh
ls -l /etc/ssh

sudo rm /etc/ssh/ssh_host_*
```

## Automate creation of SSH host keys

Copy and paste these contents into regenerate_ssh_host_keys.service

```sh
[Unit]
Description=Regenerate SSH host keys
Before=ssh.service
ConditionFileIsExecutable=/usr/bin/ssh-keygen
 
[Service]
Type=oneshot
ExecStartPre=-/bin/dd if=/dev/hwrng of=/dev/urandom count=1 bs=4096
ExecStartPre=-/bin/sh -c "/bin/rm -f -v /etc/ssh/ssh_host_*_key*"
ExecStart=/usr/bin/ssh-keygen -A -v
ExecStartPost=/bin/systemctl disable regenerate_ssh_host_keys
 
[Install]
WantedBy=multi-user.target
```
{: file="regenerate_ssh_host_keys.service" }

```sh
nano regenerate_ssh_host_keys.service

sudo chown root:root regenerate_ssh_host_keys.service

sudo mv regenerate_ssh_host_keys.service /etc/systemd/system

sudo systemctl daemon-reload

sudo systemctl enable regenerate_ssh_host_keys.service

sudo systemctl status regenerate_ssh_host_keys.service # verify it is enabled
```

## Make sure machine-id is empty

```sh

cat /etc/machine-id # needs to be unique

sudo truncate -s 0 /etc/machine-id # empty it out

# check to ensure symlink exists (if it doesn't create it - sudo ln -s /var/lib/dbus/machine-id /etc/machine-id)

ls -l /var/lib/dbus/machine-id
```

## Run the following to make sure your image is as clean as possible

```sh
sudo apt clean

sudo apt autoremove

sudo poweroff
```

## Post Set-up commands to run

You should change the hostname for your new VM's created form the clone so they are easy to identify

```sh

sudo nano /etc/hostname # change it to whatever you want

sudo nano /etc/hosts # find the old hostname an dupdate it

```