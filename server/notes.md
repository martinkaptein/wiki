# Server notes

## List of software

`nginx screen certbot python3-certbot-nginx pandoc groff imagemagick transmission-cli`

## Fixes

### Nginx systemctl

Nginx Systemctl reload

In the systemd unit file (`systemctl status nginx`):

Replace `ExecStop=` with `KillSignal=QUIT` and reload systemd daemon (`systemctl daemon-reload`).

### SSH troubleshooting

On host:

Add to ~.ssh/config

```
Host *
   HostkeyAlgorithms +ssh-rsa
   PubkeyAcceptedAlgorithms +ssh-rsa
```

On server:

In /etc/ssh/sshd_config

```
Subsystem       sftp    internal-sftp
```

