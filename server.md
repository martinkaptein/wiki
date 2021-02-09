# Just some notes about VPS server

## Auth

Local machine: `ssh-keygen -t rsa -b 4096`
Transfer key: `ssh-copy-id -i /input.pub target@server`

Change `/etc/ssh/sshd_config` >> UsePam no, PasswordAuthentication no, ChallengeResponseAuthentication no

Restart: `systemctl reload sshd`

## Networking
`/etc/network/interfaces.d/eth0`

(example)
```
auto eth0
        iface eth0 inet static
        address 93.115.22.86
        netmask 255.255.255.0
        gateway 93.115.22.1
        dns-nameservers 8.8.8.8 8.8.4.4

iface eth0 inet6 static
        address 2a0c:b9c0:f:439b::1
        netmask 124
        gateway 2a0c:b9c0:f:439b::f
```
Restart: `systemctl restart networking`

## Server software

- nginx
- certbot
- python3-certbot-nginx

### Nginx

Restart: `sudo systemctl reload nginx`

In /etc/ngnix/sites-avaiable/stuff:

Configure:

Remove default_server after listen.

```
root /var/sites/sonata8/public/;

index index.html index.htm index.nginx-debian.html;

server_name sonata8.com www.sonata8.com;

error_page 404 /404.html;
location = /404.html {
root /var/sites/sonata8/public/;
internal;
}

if ($host = 'www.sonata8.com') {
	return 301 https://sonata8.com$request_uri;
}

```

To enable run:

`ln -s /etc/nginx/sites-available/sonata8 /etc/nginx/sites-enabled/`

### Certbot

`certbot --nginx`

`crontab -e`

Enter below:

`1 1 1 * * certbot renew`

## Cosmetic

Vi Mode in bash: `set -o vi` >> .bashrc
`alias v='vim'` >> .bashrc

## Misc

Server reboot/restart: `sudo reboot`

## Domain stuff

3 A recordings from {@;{star};www} pointing to ipv4, the same but AAAA records pointing to ipv6.

## Certbot wildcard cert

`certbot certonly --manual --preferred-challenges=dns --email martin@martinkaptein.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d "*.sonata8.com"`
