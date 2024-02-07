---
title: Create ZFS Storage Folder on Proxmox Server
date: 2023-11-29 9:03:20 +/-TTTT
categories: [Proxmox]
tags: [Proxmox,Ubuntu,LXC] # TAG names should always be lowercase
author: roberth
comments: false
---

Lets start by listing the currently available data sets

```sh
zfs list
```

This should give you a list of folders (if any exist)

To create a new data set, run the following command. This will also set some default permissions.

```sh
zfs create -o mountpoint=/tank/data/photos/ -o acltype=posixacl -o xattr=sa -o aclinherit=passthrough tank/data/photos
```

To set a quota on the dataset

```sh
zfs set quota=1000G tank/data/photos
```

To remove the dataset

```sh
zfs destroy -R -r tabk/data/photos
```

If you want to use the dataset in an LXC

```sh
nano /etc/pve/lxc/{INSERT_LXC_ID_HERE}.conf
```
