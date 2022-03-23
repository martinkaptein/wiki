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
- fail2ban

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

location ~* \.(js|css|png|jpg|jpeg|gif|svg|ico|pdf|woff2)$ {
expires 7d;
add_header Cache-Control "public";
}

location ~* \.(js|css|png|jpg|jpeg|gif|svg|ico|woff2)$ {
expires 33d;
}

add_header Content-Security-Policy "default-src 'self' *.exception.com;";
add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options nosniff;
add_header 'Referrer-Policy' 'strict-origin';
add_header Strict-Transport-Security 'max-age=31536000; includeSubDomains; preload' always;

```

Add HTTP2 (workaround for now):

```
listen [::]:443 http2 ssl; # managed by Certbot
listen 443 http2 ssl; # managed by Certbot
ssl_certificate /etc/letsencrypt/live/kaptein.me/fullchain.pem; # managed...
```

To enable run:

`ln -s /etc/nginx/sites-available/sonata8 /etc/nginx/sites-enabled/`

### Certbot

`certbot --nginx`

`crontab -e`

Enter below:

`1 1 1 * * certbot renew`

## Prosody (XMPP)

```
apt install prosody
```

Add admin in `/etc/prosody/prosody.cfg.lua`

`admins = { "chad@example.org" }`

Set server URL/Domain in the `VirtualHost` param.

Add certificate (assuming you already created one):

```
prosodyctl --root cert import /etc/letsencrypt/live/
```

Add user:

```
prosodyctl adduser chad@example.org
```

Make sure registration disabled!

Restart:

```
systemctl restart prosody
```

## Cosmetic

Vi Mode in bash: `set -o vi` >> .bashrc
`alias v='vim'` >> .bashrc

## Misc

Server reboot/restart: `sudo reboot`

## Domain stuff

3 A recordings from {@;{star};www} pointing to ipv4, the same but AAAA records pointing to ipv6.

## Certbot wildcard cert

`certbot certonly --manual --preferred-challenges=dns --email martin@martinkaptein.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d "*.sonata8.com"`

## Local Ubuntu server disk resizing

lsblk to confirm situation.

```
sudo lvextend /dev/ubuntu-vg/ubuntu-lv /dev/sda3
```

## Locale error

`export LC_ALL=C`

## SSHFS (SSH Filesystem)

For key auth:

create `.ssh/config`:

```
Host hostname
     HostName hostname
     User username
     Port 22
     IdentityFile /home/whatever/.ssh/id_rsa
```

Connect:

```
sshfs username@hostname:/path/ mountpoint
```
