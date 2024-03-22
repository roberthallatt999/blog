---
title: How to upload ISO files from your local computer to Proxmox
date: 2023-04-01 12:15:29 +/-TTTT
categories: [Proxmox]
tags: [Proxmox] # TAG names should always be lowercase
author: roberth
comments: false
---

Sometimes, Proxmox doesn't play nice when you try to upload an ISO file. There can be size restrictions and other bugs that stop you in your tracks. Here is an easy command that you can run.

```sh
scp file_address root@192.xxx.x.xxx:/var/lib/vz/template/iso
```

Or use wget to download the ISO

## Centos 8

```sh
wget -c http://centos.les.net/8-stream/isos/x86_64/CentOS-Stream-8-20240129.0-x86_64-boot.iso -P /var/lib/vz/template/iso
```