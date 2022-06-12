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
