# MacOS Initialization

## Homebrew

### CLI

```
fish git transmission-cli pandoc ffmpeg yt-dlp fzf neovim imagemagick testdisk blackhole-2ch fdupes wkhtml2pdf
```

### Cask

```
brave-browser keepassxc iterm2 rectangle mpv musescore android-platform-tools aldente nextcloud alt-tab
```

### Extra

Choose what you need.

```
basictex firefox calibre inkscape spotify thunderbird go groff onlyoffice vlc
```

## Configure

Use init script.

`brew analytics off`

`cp configs/config.fish ~/.config/fish/`

Intel Mac Brew: /usr/local/Cellar/

```
pmset -u haltlevel 25 haltremain 30
```

### Privacy

Add to Hosts (`/private/etc/hosts`) to restrict Apple from `server/host_additions:`

Official source:

https://support.apple.com/en-us/HT210060

Flush DNS cache `sudo killall -HUP mDNSResponder`.

Get the full adblock host file from [here](https://github.com/StevenBlack/hosts).
