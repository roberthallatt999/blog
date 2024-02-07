---
title: Upgrade Proxmox from CLI
date: 2024-02-07 9:59:00 +/-TTTT
categories: [Proxmox]
tags: [Proxmox,Ubuntu,LXC] # TAG names should always be lowercase
author: roberth
comments: false
---

To upgrade only packages that are installed.

```sh
apt-get update && apt-get upgrade
```

No reboot is necesary.

To update a node entirely

```sh
apt-get update && apt-get dist-upgrade
```

Only reboot the node if necesary.