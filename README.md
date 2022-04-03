# setup
Just repo of my personal computer setup


## Notes

Everything should be put in the right dir.

Vim folder >> .vim (probably in home dir)

configs/i3config >> .config/i3/config (again most likely)

configs/vimrc >> .vimrc

configs/config.fish >> .config/fish/config.fish

configs/compton.conf >> .config/compton.conf

wall/{stuff} >> ~/Pictures/{stuff}

## Other stuff

FISH with vi bindings

### Bash

Add to bottom:

```
fish
setxkbmap -option caps:swapescape
```

### Writing

Using LaTeX and pandoc.

Write in markdown.

For "normal" word docs use following front matter:

```
\title{stuff}
\date{27-01-2020}
\author{martin \\ \\ more stuff}

\pagenumbering{gobble}
\maketitle
\newpage
\tableofcontents
\newpage
\pagenumbering{arabic}


```

#### Build command

`pandoc -o output.{pdf,docx,whatever} input.md input2.md etc.`

`pandoc -o output.pdf input.md --pdf-engine=xelatex -V mainfont='Ubuntu'

## Misc

### Internal audio record together with computer audio

Record internal audio **together** with computer audio (monitor)
Requires Pulseaudio (and ALSA).

Run:
`pactl load-module module-loopback latency_msec=1`

Then select in pulse audio volume ctrl under recording input from *Monitor of Built-in ...*.

To unload:
`pactl unload-module <number>`

### TTY vs Graphical

#### Boot by default

 On systemd system

- To Graphical

`systemctl set-default multi-user.target`

- To Graphical

`systemctl set-default graphical.target`

#### Switch to TTY only (from graphical)

`systemctl start multi-user.target`

#### Switching back to graphical

`systemctl start graphical.target`

### Check battery

`acpi`

### Encryption of removable media

#### Encryption setup

`sudo cryptsetup luksFormat /dev/sdb`

#### Opening

`sudo cryptsetup luksOpen /dev/sdb cryptUSB`

(now use `/dev/mapper/`)

#### Formatting

`sudo mkfs.ext4 /dev/mapper/cryptUSB`

#### Mounting

`sudo mount /dev/mapper/cryptUSB /media/cryptUSB`

#### Closing

(umount)

`sudo cryptsetup close /dev/mapper/cryptUSB`

### NVIM

Inside nvim config dir add to init.vim:
(If using nvim)
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
``` 

### UFW firewall for personal use (pc/laptop)

```
ufw enable
ufw default deny incoming
ufw default allow outgoing
```

### Redshift

```
redshift -l 52.3779:4.8970
```
