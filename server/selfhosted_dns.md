# Notes for selfhosted DNS

`apt install dnsmasq`

Find out interface with `ip address` or `/etc/network/interfaces.d/eth0`.

Set `interface=x`, `domain-needed` in /etc/dnsmasq.conf.

Note the (default) port in /etc/dnsmasq.conf.

(Optionally) set nameserver in /etc/resolv.conf:

```
nameserver 8.8.8.8
```

Import hosts adblock in /etc/hosts, plus custom records.

Optionally copy the contents of `dnsmasq_wild...` over into /etc/dnsmasq.conf.
This way you can set up very strict wildcard domain blocking.

## Nginx DoT

`mkdir /etc/nginx/streams/`

Have a SSL certificate ready, created with certbot for example.

Create a new config in /etc/nginx/streams:

```
upstream dns-s8 {
        server    127.0.0.1:53;
}

server {
        listen 853 ssl;
        ssl_certificate /etc/letsencrypt/live/sonata8.com/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/sonata8.com/privkey.pem; # managed by Certbot

        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

        proxy_pass dns-s8;

}
```

Under server set correct port, by default dnsmasq uses port 53.
This is the port you have noted earlier.

The certificate can be copied over from a config that already has a certificate.
The important thing is that the domain resolves.

Include this block in the /etc/nginx/nginx.conf:

```
stream {
        include /etc/nginx/streams/*;
}
```

Reload nginx.
After every change to hosts, dnsmasq has to be restarted as well:

```
systemctl restart dnsmasq
```

## Setting DNS on local machine

### Linux

On Linux, in /etc/resolv.conf:

```
nameserver  your_servers_public_ip
nameserver ipv6
```

### MacOS

Either in Network GUI settings, or:

```
sudo networksetup -listallnetworkservices
sudo networksetup -setdnsservers Wi-Fi ip.adr.here.0 optional.secondary.0.0
```

Fallback:

```
networksetup -setdnsservers Wi-Fi
```

Verify:

```
networksetup -getdnsservers Wi-Fi
```

### iOS

iOS is difficult, you will need to build a profile. 
Either create a profile using **Apple Configurator** from Mac App Store (only for Mac) or use [this website](https://dns.notjakob.com/tool.html).
