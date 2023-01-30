# Server notes

## List of software

`nginx screen certbot python3-certbot-nginx pandoc groff imagemagick transmission-cli`

## Fixes

Nginx Systemctl reload

In the systemd unit file (`systemctl status nginx`):

Replace `ExecStop=` with `KillSignal=QUIT` and reload systemd daemon (`systemctl daemon-reload`).
