---
title: MacOS VPN 连接内网服务器进行开发
date: 2024-06-28 14:55:51
tags:
---

## 超时问题

已经能够连接 VPN，但连接服务器超时

### 解决方案

经过调研发现需要使用以下命令，才能正常连接服务器

```sh
sudo sysctl net.link.generic.system.hwcksum_rx=0
sudo sysctl net.link.generic.system.hwcksum_tx=0
```

## 分流问题

已经能够通过 VPN 连接服务器，但是因为连接了 VPN，所以只能访问实验室内网，无法访问互联网。如果需要访问互联网，需要先关闭梯子。这样非常不方便。

### 解决方案

思路是手动设置只有服务器的流量走 VPN。

在 VPN 设置中，取消 “通过 VPN 发送所有流量”。

在开启 VPN 和不开启 VPN 的情况下，各使用一次 `ifconfig` 查看网络接口。开启 VPN 后应该会多出一个网络接口，即为 VPN 的网络接口。我这里是 `ppp0`

使用以下命令，设置目标地址为服务器的流量走 VPN

> server-ip 替换成服务器地址。ppp0 是我使用的 VPN 的接口名称，替换成你自己的 VPN 接口名称。

```sh
sudo route -n add <server-ip> -interface ppp0
```

这样就可以同时访问服务器和互联网了。