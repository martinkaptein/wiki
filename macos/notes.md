# MacOS Notes

## Hosts

Edit as admin `/private/etc/hosts`.
Flush DNS cache `sudo killall -HUP mDNSResponder`.

## CUPS Printing:

```
cupsctl WebInterface=yes
```

http://localhost:631

## Recording internal audio (and microphone)

In Audio MIDI Setup:

Multi-Output Device: BlackHole and External Headphones OR Speakers

Aggregate Device: BlackHole and Microphone

In sound settings set default output to Multi-Output and input to Aggregate.
Check sound playback app accepts default settings.

Record.

## Finding duplicates on MacOS

`fdupes -r .`

`fdupes -rdN .` will automatically preserve the first file instead of asking each time. -r = recursive, -d = delete, -N = preserve first, delete the rest.
