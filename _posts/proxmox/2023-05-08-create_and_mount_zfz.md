---
title: How to update hostname for Ubuntu server
date: 2023-02-01 7:11:45 +/-TTTT
categories: [Proxmox]
tags: [Proxmox,Ubuntu,VM] # TAG names should always be lowercase
author: roberth
comments: false
---

Create data set and mount point with ACL permissions

zfs create -o mountpoint=/storage/timemachine/ -o acltype=posixacl -o xattr=sa -o aclinherit=passthrough rpool/timemachine

# set storge quota

zfs set quota=2000G rpool/timemachine

# fstab

timemachine     /zfs/timemachine        9p trans=virtio,version=9p2000.L,nobootwait,rw,msize=524288,user_xattr,posixacl,_netdev 0 0

# mount

mount -a 

# check it

findmnt -lo source,target,fstype,label,options,used -t 9p