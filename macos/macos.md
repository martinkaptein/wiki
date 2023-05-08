# MacOS Initialization

## Homebrew

### CLI

```
fish git transmission-cli pandoc ffmpeg go yt-dlp fzf neovim groff imagemagick testdisk blackhole-2ch fdupes
```

### Cask

```
brave-browser keepassxc iterm2 rectangle mpv musescore android-platform-tools aldente nextcloud
```

### Extra

```
basictex firefox calibre inkscape spotify thunderbird
```

## Configure

`brew analytics off`

`cp configs/config.fish ~/.config/fish/`

Intel Mac Brew: /usr/local/Cellar/

```
pmset -u haltlevel 25 haltremain 30
```

### Privacy

Add following to Hosts (`/private/etc/hosts`) to restrict Apple:

```
0.0.0.0 googlesyndication.com
0.0.0.0 doubleclick.net
0.0.0.0 mesu.apple.com
0.0.0.0 google-analytics.com
0.0.0.0 gdmf.apple.com
0.0.0.0 xp.apple.com
0.0.0.0 updates.g.aaplimg.com
0.0.0.0 updates.cdn-apple.com
0.0.0.0 appldnld.apple.com
0.0.0.0 configuration.apple.com
0.0.0.0 gg.apple.com
0.0.0.0 gs.apple.com
0.0.0.0 ig.apple.com
0.0.0.0 oscdn.apple.com
0.0.0.0 osrecovery.apple.com
0.0.0.0 skl.apple.com
0.0.0.0 swcdn.apple.com
0.0.0.0 swdist.apple.com
0.0.0.0 swdownload.apple.com
0.0.0.0 swscan.apple.com
0.0.0.0 updates-http.cdn-apple.com
0.0.0.0 updates.cdn-apple.com
0.0.0.0 xp-cdn.apple.com
0.0.0.0 cssubmissions.apple.com
0.0.0.0 diagassets.apple.com
0.0.0.0 guzzoni.apple.com
0.0.0.0 phonesubmissions.apple.com
```

Official source:

https://support.apple.com/en-us/HT210060

Flush DNS cache `sudo killall -HUP mDNSResponder`.

Get the full adblock host file from [here](https://github.com/StevenBlack/hosts).
