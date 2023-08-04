#!/bin/bash

# Inititialize vim, neovim, pandoc, fish config, for any nix system

# vim and neovim
cp -r vim ~/.vim
cp configs/vimrc ~/.vimrc
mkdir ~/.config
mkdir ~/.config/nvim
cp configs/init.vim ~/.config/nvim/

# fish
 mkdir ~/.config/fish
 cp macos/config/config.fish ~/.config/fish/
 echo '- Set fish as default shell'
 echo '- run fish'
 echo '- Run fish_vi_key_bindings'

 # Pandoc
 mkdir ~/.pandoc
 cp write/pandoc.css ~/.pandoc/pandoc.css
 cp font/Sofia_Sans/static/* ~/.pandoc/
