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
*/5  *  *  *  * php -f /var/www/nextcloud/cron.php --define apc.enable_cli=1
```

Check wiki for correct cron specs

- PHP Env vars in /etc/php/7.4/fpm/pool.d/www.conf

# TODO after installation

- Install neccessary apps (contacts, calendars, tasks, keeweb, news, notes) and remove unneccessary.
- Import these things and upload pdb.
- Setup external apps (optional).
- dashboard/dark theme/background color
