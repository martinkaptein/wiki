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

Via CUPS:

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

## Record audio

If Pulseaudio record with:

```
parecord -r output.mp3
```
