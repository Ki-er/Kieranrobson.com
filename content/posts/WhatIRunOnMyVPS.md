---
title: "What I Run On My VPS"
date:  2022-06-13T10:15:00
tags: ["VPS", "Docker"]
categories: ["Selfhosting"]
description: "What I Run On My VPS"
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
# What I run on my VPS
I currently run all my services on a VPS (Virtual Private Server) due to just graduating and not having anywhere to host a homelab fulltime. 

I use an OVH Essential VPS with 2 vCores and 4GB RAM. This was a huge upgrade from the base tier Digitial Ocean droplet I had which only allowed me 1 vCore and 1GB RAM. (A great recommendation from my friend [Crimsontome](https://github.com/CrimsonTome) who also [inspired](https://blog.crimsontome.com/posts/my-current-vps-setup/) this blog post.)

Lets get into it!

## Docker and Docker Compose
I host all my services within [Docker](https://www.docker.com/) containers for ease of management and for the ability to assign ports to services that do not traditionally use ports such as Discord bots.

While the majority of my services use Docker commands, some of them such as NGINX Proxy Manager use Docker-Compose to be setup. 

## Portainer
To manage said containers, I use [Portainer](https://github.com/search?q=portainer).

This great GUI allows for an easy way to start, stop and restart containers while also allowing for easy log viewing of each individual containers.

The ability to see every containers status at a glance is invaluable as the ammount of containers I run grows. 

## Jekyll Static Sites
I host two [Jekyll](https://github.com/jekyll/jekyll) sites. This one your reading now, and a complimentary [docs](https://docs.kieranrobson.com) site that I post guides and my own documentation so that I can remember commands. 

I went with Jekykll rather than other static site generators as I wanted to self host and couldnt figure out the best way to get them running in a Docker container.

Plus, the benefit of having this awesome [theme](https://github.com/cotes2020/jekyll-theme-chirpy) is a bonus. 

## LittleLink
[LittleLink](https://github.com/sethcottle/littlelink) is a lightweight linktree alternative. [LittleLink-Server](https://github.com/techno-tim/littlelink-server) is a fork of the services that allows you to run it within a Docker container and easily manage it using Docker-Compose. 

You can find my version here: [https://links.kieranrobson.com](https://links.kieranrobson.com/)

## Discord Bots and Ouroboros
I develop and host three [Discord](https://discord.com) bots.

The first one is [Clarence](https://github.com/KieranRobson/Clarence-Bot). This bot is a multipurpose bot used in a private server with my friends. 

The next [bot](https://github.com/hullcss/hullcss-discord-bot) is for the [Hull University Computer Science Society](https://hullcss.org), in which I used to be president. This bot helps automate some tasks such as the Code of Conduct verification and also allowing for embeds of information rather than traditonal messages.

The final bot is the bot for the [Hull University Robotics Society](https://github.com/Hull-Robotics-Society). This bot is similar to the computer science society bot however does slighlty different things such as using buttons rather than dropdown boxes for role assignment and small elements like that.

I put these in their own Docker containers so that I could use monitor them using Uptime Kuma (see below).

A benefit to this approach is that using GitHub actions, I can  push code to GitHub and it will be pushed to Docker Hub then pulled down to my containers using [Ouroboros](https://github.com/pyouroboros/ouroboros), all automatically without the need for me to do anything.

## NGINX Proxy Manager 
To give my VPS fancy public facing urls such as [blog.kieranrobson.com](https://blog.kieranrobson.com) I use [NGINX Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager?utm_source=nginx-proxy-manager) in conjunction with [Cloudflare](https://www.cloudflare.com/).

These services together allow me to hide my VPS URL from the outside world by proxying it while also allowing me to get free SSL certificates giving my sites `https` security. 

## Final Thoughts 
While there are other services I havent went into detail such as [Archi Steam Farm](https://github.com/JustArchiNET/ArchiSteamFarm) and [Plex Meta Manager](https://github.com/meisnate12/Plex-Meta-Manager), these are the main services that I run for now. 

I might keep this post updated or make montly update posts refering back to this one for when I make big changes to my setup. Who knows. 
