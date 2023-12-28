---
title: How to pin your Proxmox kernal
date: 2023-04-01 12:15:29 +/-TTTT
categories: [Proxmox]
tags: [Proxmox, Kernal] # TAG names should always be lowercase
author: roberth
comments: false
---

Why would you want to pin your Proxmox kernal? Consider this scenario. I have a NVIDIA driver that my Plex and Emby servers use that works great with the kernal that is currently installed. If I decide to install the latest updates for Proxmox and it contains a new Kernal, it could cause problems for that driver and possibly break other things as well. 

There is a way to configure your NVIDIA set-up so that it automatically upgrades the drivers when you install a new kernal but that doesn't mean it won't break something.

Here is the code that I ran to to pin my kernal. The version of Proxmox that I am running is 7.3.6.

1. List all of the available kernals (there cpuld be more than one)

```sh
/usr/sbin/proxmox-boot-tool kernel list
```

2. Find out the version of kernal you are currently using

```sh
uname -r
```
This will output something like 5.15.85-1-pve

2. Finally, run the command to pin your kernal 

```sh
/usr/sbin/proxmox-boot-tool kernel pin << paste what was output from the previous command here >>
```

That's it! Now you should be able to run the update tool in Proxmox and not worry about a new Kernal breaking your set-up until you are confident you can upgrade it.