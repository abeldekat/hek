# Hek

This project aims to provide a fully configured virtual private server(vps) in the cloud. Ansible is used to install the following open source software on the server:
* [wireguard vpn](https://www.wireguard.com)
* [searxng meta search engine](https://github.com/searxng)
* [caddy webserver](https://github.com/caddyserver/caddy)
* [dnscrypt-proxy](https://github.com/DNSCrypt/dnscrypt-proxy)
* [firewalld firewall](https://firewalld.org/)

The user is expected to create a server on any cloud hosting provider. The cheapest server can be chosen as the runtime requirements are below 400MB RAM and 3GB file storage 

## Requirements
* The server must be debian 11 bullseye
* The pc you use to run these scripts must run on linux
