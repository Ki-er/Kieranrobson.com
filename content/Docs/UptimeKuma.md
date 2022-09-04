---
title: "How to install Uptime Kuma"
date: 2022-06-08T18:28:00
tags: ["Monitoring", "Uptime", "Stats"]
categories: ["Guides"]
description: "How to install Uptime Kuma"
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
---

Uptime Kuma is a self-hosted monitoring tool like "Uptime Robot" with support for notifciations, status pages and many types of monitors.

## Intall Uptime Kuma
Install Docker 
```bash
sudo apt install docker.io
```

Run the following Docker command
```docker
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
```

Head to `yourip:30001` and enter your new account details.

## Add your first monitor
### HTTPS
To create a HTTPS monitor, fill in the details below with the website you'd like to monitor 

![image](https://i.imgur.com/17t6Z1m.png)

then press accept at the bottom. 

### Ping 
Like the HTTPS above, you need to fill in the details however I recommend placing your applications into docker containers so that you can assign a port easily then use this for monitoring. 

![image](https://i.imgur.com/WucP36H.png)


I have no had any expirience with the other types of monitoring however when I do, I will write them up here. 

## Status Page 
Press the status page button and add your name of the status page. This will create a page which outlines all details

This can be found at `yourip:3001/status/name`. 

Get started by adding a group and then adding some monitors to that group.

![image](https://i.imgur.com/HBYi9Iy.png)

## Notifications
When configuring a monitor, you can create a notification.

There are many types of notifications however for this guide, we will use Discord.

![image](https://i.imgur.com/fiSi7tS.png)

To get a Discord Webhook:
- right click on a channel
- Press edit channel
- Press Integrations
- Create a webhook
- Copy webhook URL
- Paste webhook URL into `Discord Webhook URL` on Uptime Kuma

I would recommend turning on `Apply on all existing monitors` so you don't need to configure every monitor individually.