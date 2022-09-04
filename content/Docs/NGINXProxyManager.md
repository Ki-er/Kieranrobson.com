---
title: "How to install NGINX proxy manager and Cloudlfare"
date: 2022-05-30T19:56:00
tags: ["NGINX Proxy Manager", "Cloudflare", "Domains"]
categories: ["Guides"]
description: "How to install NGINX proxy manager and Cloudlfare"
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

NGINX proxy manager is what it says on the tin, its a proxy manager allowing you to point a domain to an IP and port on your server so that the user can see the service without needing the IP and port.
## What is Cloudflare 
Cloudflare is a content delivery network (CDN). This will not only improve latency to your website, it will also hide the IP that visitors see when they are connected to your self hosted services.


# Setup
## NGINX Proxy Manager Setup
### Install Dependancies
Firstly, we will install docker-compose as this is what NPM will use to host itself in a docker container. You can do this by typing the commands below.
```bash
sudo apt install docker-compose
```
Check the version has been installed correctly by doing 
```bash
docker-compose -v
```

### Creating the NGINX docker-compose file
```bash
mkdir NGINX-Proxy-Manager
cd NGINX-Proxy-Manager
touch docker-compose.yml
nano docker-compose.yml
```

Copy the following yml code into your newly created docker compose file
```yaml
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
The run 
```bash
docker-compose up -d
```
Head to `yourip:81` and then login with the default 
* username: admin
* password: changeme

You will be prompted to change the login details.


## Cloudflare Setup

* Head to `https://dash.cloudflare.com/` and make an account
* You will be prompted to change the name servers of your domain provider, each provider is differnt on how to do this but cloudflare provides guides for common ones. 

> This may take a while for the name servers to propergate.
{: .prompt-tip }

Once the names have propergated, head to the `dns` tab

Add an A Name record and fill in the details below
```
Type: A
Name: Your domain i.e kieranrobson.com
Target: Your IP i.e 11.11.111.111
Proxied: On
TTL: Auto
```

Add a second A record so that you can setup subdomains such as docs.kieranrobson.com
```
Type: A
Name: The name of the subdomain you'd like i.e docs
Target: Your IP i.e 11.11.111.111 
Proxied: Off
TTL: Auto
```

### NGINX Proxy Host Setup
* Click the green proxy buttom
* Click add proxy host at the top right of the wite box
* Enter the following details

```
Domain Names: The subdomain.domain.com i.e docs.kieranrobson.com
Scheme: http or https (This will more than often use http unless youre using port 80 or 443)
Forward Hostname: Your IP i.e 11.11.1111.111
Forward Port: The Port in which the service is running on externally i.e 9000 is portainers default external port

Turn on Block Common Exploits
```

Head to the `SSL` tab 
* Select a new SSL certifcate 
* Force SSL
* HTTP/2  Support (Optional)
* Agree to the terms and conditions

> If you recieve an error, double check proxied is turned off in the cloudflare dashboard.
{: .prompt-tip }

Once the proxy shows `Lets Encrypt` under the SSL heading, head back to cloudflare and turn on the proxied options.

Finally head to your subdomain and it should have worked! 

If this doesnt work and youre getting an error, feel free to hit me up on discord Kieran#0981 and we will get it working!