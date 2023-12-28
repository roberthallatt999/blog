---
title: Using PCT commands
date: 2023-04-02 11:51:30 +/-TTTT
categories: [Proxmox]
tags: [Proxmox] # TAG names should always be lowercase
author: roberth
comments: false
---

Here are some useful pct commands for every day management of your containers and VM's.

## Containers

Start container. 

```sh
pct start {container_id}
```

Stop container. 

```sh
pct start {container_id}
```

Resize boot disk. 

```sh
pct resize {container_id} rootfs {size in Gigabytes ex 8G}
```