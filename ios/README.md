# Things applicable to devices running iOS

The adguard list is not regularly updated. It's only a conversion of the hosts file.
Either set a custom DNS Server, or import `/server/host_additions` into AdGuard Pro.
If it doesn't accept the hosts format change it to:

```
||domain.com
```

Optionally add trailing tag:

```
||domain.com^$important
```
