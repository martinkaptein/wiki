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
pacman -Syy (update database) -Syu (system update) -Syyu -Rns (safe, clean removal) -R (only remove one package) -Runs (use this for very clean removal) -Rs -Qi (query installed) -Ss -Sc (clean cache, remove uninstalled) -Scc (aggressive clean cache, remove cache of installed) -U (user install, downgrade) -Rcns (very aggressive remove - don't use) -Qdtq (view unused packages > remove with pacman -R $(pacman -Qdtq)) -Sw (download without installing>cache)
/var/cache/pacman/pkg
```

```
mkpkg -si (install local (AUR) package)
```

## Record audio

If Pulseaudio record with:

```
parecord -r output.mp3
```
