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

## Server software (ubuntu)

- nginx
- certbot
- python3-certbot-nginx
- pandoc
- groff/troff

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

add_header Content-Security-Policy "default-src 'self' 'sha256-HE52nGYAuxVG6bOcvE5Tg1LGW3PsiAonN3nPK/hmRug=' *.exception.com;";
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

## Radicale

```
apt install radicale apache2-utils python3-bcrypt python3-passlib
```

Check that you have subdomain e.t. sub.domain.com pointing to ipv4 (a) and ipv6 (same as above with *www*)

/etc/radicale/config :

```
[server]
# Bind all addresses
hosts = 0.0.0.0:5232, [::]:5232

[auth]
type = htpasswd
htpasswd_filename = /etc/radicale/users
htpasswd_encryption = plain

[storage]
filesystem_folder = /var/lib/radicale/collections

[rights]
type = from_file
file = /etc/radicale/rights
```

Create /etc/radicale/users

```
username:password
```

Set user role in /etc/radicale/rights:

```
[admin]
user: admin
collection: .*
permissions: RWrw
```

Create another nginx in /etc/ngnix/sites-avaiable/rad

```
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name rad.domain.com;
    location / {
        proxy_pass http://localhost:5232/; # The / is important!
    }
}
```

Link to sites-enabled.

Reload nginx.

Create certbot certificate for it (for the subdomain):

`certbot --nginx`

Create systemd service:

/etc/systemd/system/radicale.service

```
[Unit]
Description=A simple CalDAV (calendar) and CardDAV (contact) server

[Service]
ExecStart= radicale
Restart=on-failure

[Install]
WantedBy=default.target
```

```
systemctl daemon-reload
systemctl enable --now radicale
```

Create calendar and address book through web interface.

# Nextcloud

Nextcloud install notes:

apt: nginx python3-certbot-nginx mariadb-server php7.4 php7.4-{fpm,bcmath,bz2,intl,gd,mbstring,mysql,zip,xml,curl}

```
mysql_secure_installation
```

Answer all with yes.

```
mysql -u root -p
```

```
CREATE DATABASE nextcloud;
GRANT ALL ON nextcloud.* TO 'root'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EXIT;
```

Deal with DNS subdomain.

```
certbot certonly --nginx -d cloud.martinkaptein.com
```

Create new nginx config from [here](https://docs.nextcloud.com/server/latest/admin_manual/installation/nginx.html) or [here](https://landchad.net/nextcloud/)

```
upstream php-handler {
    server unix:/var/run/php/php7.4-fpm.sock;
    server 127.0.0.1:9000;
}
map $arg_v $asset_immutable {
    "" "";
    default "immutable";
}
server {
    listen 80;
    listen [::]:80;
    server_name nextcloud.example.org ;
    return 301 https://$server_name$request_uri;
}
server {
    listen 443      ssl http2;
    listen [::]:443 ssl http2;
    server_name nextcloud.example.org ;
    root /var/www/nextcloud;
    ssl_certificate     /etc/letsencrypt/live/nextcloud.example.org/fullchain.pem ;
    ssl_certificate_key /etc/letsencrypt/live/nextcloud.example.org/privkey.pem ;
    client_max_body_size 512M;
    client_body_timeout 300s;
    fastcgi_buffers 64 4K;
    gzip on;
    gzip_vary on;
    gzip_comp_level 4;
    gzip_min_length 256;
    gzip_proxied expired no-cache no-store private no_last_modified no_etag auth;
    gzip_types application/atom+xml application/javascript application/json application/ld+json application/manifest+json application/rss+xml application/vnd.geo+json application/vnd.ms-fontobject application/wasm application/x-font-ttf application/x-web-app-manifest+json application/xhtml+xml application/xml font/opentype image/bmp image/svg+xml image/x-icon text/cache-manifest text/css text/plain text/vcard text/vnd.rim.location.xloc text/vtt text/x-component text/x-cross-domain-policy;
    client_body_buffer_size 512k;
    add_header Referrer-Policy                      "no-referrer"   always;
    add_header X-Content-Type-Options               "nosniff"       always;
    add_header X-Download-Options                   "noopen"        always;
    add_header X-Frame-Options                      "SAMEORIGIN"    always;
    add_header X-Permitted-Cross-Domain-Policies    "none"          always;
    add_header X-Robots-Tag                         "none"          always;
    add_header X-XSS-Protection                     "1; mode=block" always;
    fastcgi_hide_header X-Powered-By;
    index index.php index.html /index.php$request_uri;
    location = / {
        if ( $http_user_agent ~ ^DavClnt ) {
            return 302 /remote.php/webdav/$is_args$args;
        }
    }
    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }
    location ^~ /.well-known {
        location = /.well-known/carddav { return 301 /remote.php/dav/; }
        location = /.well-known/caldav  { return 301 /remote.php/dav/; }
        location /.well-known/acme-challenge    { try_files $uri $uri/ =404; }
        location /.well-known/pki-validation    { try_files $uri $uri/ =404; }
        return 301 /index.php$request_uri;
    }
    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)(?:$|/)  { return 404; }
    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console)                { return 404; }
    location ~ \.php(?:$|/) {
        # Required for legacy support
        rewrite ^/(?!index|remote|public|cron|core\/ajax\/update|status|ocs\/v[12]|updater\/.+|oc[ms]-provider\/.+|.+\/richdocumentscode\/proxy) /index.php$request_uri;
        fastcgi_split_path_info ^(.+?\.php)(/.*)$;
        set $path_info $fastcgi_path_info;
        try_files $fastcgi_script_name =404;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $path_info;
        fastcgi_param HTTPS on;
        fastcgi_param modHeadersAvailable true;
        fastcgi_param front_controller_active true;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
        fastcgi_request_buffering off;
        fastcgi_max_temp_file_size 0;
    }
    location ~ \.(?:css|js|svg|gif|png|jpg|ico|wasm|tflite|map)$ {
        try_files $uri /index.php$request_uri;
        add_header Cache-Control "public, max-age=15778463, $asset_immutable";
        access_log off;     # Optional: Don't log access to assets
        location ~ \.wasm$ {
            default_type application/wasm;
        }
    }
    location ~ \.woff2?$ {
        try_files $uri /index.php$request_uri;
        expires 7d;
        access_log off;
    }
    location /remote {
        return 301 /remote.php$request_uri;
    }
    location / {
        try_files $uri $uri/ /index.php$request_uri;
    }
}
```

Replace with correct (sub-)domain

Safe, ln -s and reload nginx.

```
wget https://download.nextcloud.com/server/releases/latest.tar.bz2
tar -xjf latest.tar.bz2 -C /var/www
chown -R www-data:www-data /var/www/nextcloud
chmod -R 755 /var/www/nextcloud
```

```
systemctl enable php7.4-fpm --now
systemctl reload nginx
```
Set data in admin panel @yourdomain.

## Nextcloud fixes

- PHP memory limit in /etc/php/7.4/fpm/php.ini
- Nextcloud cron:

```
crontab -u www-data -e
*/5  *  *  *  * php -f /var/www/nextcloud/cron.php
```

Check wiki for correct cron specs

- PHP Env vars in /etc/php/7.4/fpm/pool.d/www.conf
