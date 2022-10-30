# Server notes

## Fixes

Nginx Systemctl reload

In the systemd unit file (`systemctl status nginx`):

Replace `ExecStop=` with `KillSignal=QUIT` and reload systemd daemon (`systemctl daemon-reload`).
