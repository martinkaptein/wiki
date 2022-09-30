# General Notes for Manual Arch Installation

(work in progress)

!Assuming BIOS DOS/MBR Boot!


/etc/mkinitcpio:
```
HOOKS=(base udev autodetect keyboard keymap modconf block encrypt filesystems resume fsck)
```


etc/default/grub:
```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=yourrootUUID:root root=/dev/mapper/root resume=UUID=yourSWAPuuid"
```
