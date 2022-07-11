# Arch notes

## Sudo

`/etc/sudoers`

```
username ALL=(ALL:ALL) ALL
```

## Wireless

Use IWCTL

## Bluetooth

```
systemctl enable bluetooth
systemctl start bluetooth
bluetoothctl
power on
scan on
pair <mac>
connect <mac>
```

## Printing

@ localhost:631

## Radios on/off

```
rfkill (un)block all
```

## Pacman

```
pacman -Syu -Syyu -R -Rs -Ss -Sc (clean cache) -Scc (aggressive) -U (user install, downgrade)
/var/cache/pacman/pkg
```
