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

## Misc

### Internal audio record together with computer audio

Record internal audio **together** with computer audio (monitor)
Requires Pulseaudio (and ALSA).

Run:
`pactl load-module module-loopback latency_msec=1`

Then select in pulse audio volume ctrl under recording input from *Monitor of Built-in ...*.

To unload:
`pactl unload-module <number>`

