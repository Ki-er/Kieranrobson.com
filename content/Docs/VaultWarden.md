---
title: "How to install and setup VaultWarden"
date: 2022-12-28T15:45:00
tags: ["VaultWarden", "Docker"]
categories: ["Guides"]
description: "How to install and setup VaultWarden"
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

[VaultWarden](https://github.com/dani-garcia/vaultwarden) is a fork and free open source version of [BitWarden](https://bitwarden.com/), the popular password manager. 


## Dependencies

Update the system
```bash
sudo apt update
```

## Install VaultWarden

Run the following command
```bash
docker run -d --name vaultwarden -v /vw-data/:/data/ -p AvailablePort:80 vaultwarden/server:latest
```

Head to [My Nginx Proxy Manager Guide](https://kieranrobson.com/docs/nginxproxymanager/) to setup HTTPS as VaultWarden Requires [this](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-HTTPS).

Head to `yourip:AssignedPort`.

Create an account!

## Importing from a previous password manager

- [Importing from KeePass or KeePassX ](https://github.com/dani-garcia/vaultwarden/wiki/Importing-data-from-Keepass-or-KeepassX)
- [Importing from LastPass](https://nerdschalk.com/export-lastpass-to-bitwarden/#:~:text=Once%20you%20have%20successfully%20exported%20the%20data%20from,Click%20on%20Tools%20and%20then%20click%20Import%20Data.)

## Setup Mobile App

Install the app from either [Google Play](https://play.google.com/store/apps/details?id=com.x8bit.bitwarden) or the [App Store](https://itunes.apple.com/app/bitwarden-free-password-manager/id1137397744?mt=8)

Open the app and press the settings icon in the top right hand corner.

Insert your new HTTPS url in to `Server URL`, including the `https://`

Login using your new credentials.

## Setup Web Extension

Install the app from [Here](https://bitwarden.com/download/).

Open the extension and press the settings icon in the top left

![image](https://imgur.com/U1PomES.png)

Insert your URL in the top box

![image](https://i.imgur.com/Y6n9fXn.png)

Press `Save`

Login with your credentials








