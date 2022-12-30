# MacOS

## Homebrew

### CLI

```
fish git transmission-cli pandoc ffmpeg go yt-dlp fzf neovim groff imagemagick testdisk blackhole-2ch
```

### Cask

```
brave-browser keepassxc iterm2 rectangle mpv lulu musescore android-platform-tools aldente nextcloud
```

### Extra

```
basictex firefox calibre inkscape spotify thunderbird
```

## Configure

`brew analytics off`

`cp configs/config.fish ~/.config/fish/`

Intel Mac Brew: /usr/local/Cellar/

Hosts ad blcking: /etc/hosts or /private/etc/hosts

```
pmset -u haltlevel 25 haltremain 30
```

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
