#!/bin/bash

# Update pacman

pacman -Syu --noconfirm

# Install all required programs from list

cat archlist.txt | xargs pacman -S --noconfirm

# Configure stuff

## xorg

touch $HOME/.xinitrc
echo 'exec i3' >> $HOME/.xinitrc

## vim and nvim

cp -r vim $HOME/.vim
cp configs/vimrc $HOME/.vimrc
mkdir ~/.config/nvim
cp configs/init.vim ~/.config/nvim/

## bash

touch $HOME/.bashrc
cat configs/bashrc >> $HOME/.bashrc

## fish

cp configs/config.fish $HOME/.config/fish/
fish_vi_key_bindings

## UFW

ufw enable
ufw default deny incoming
ufw default allow outgoing

## Alacritty

mkdir ~/.config/alacritty
cp configs/alacritty.yml ~/.config/alacritty/

## Cups

systemctl enable cups.service
systemctl start cups.service

## i3

mkdir ~/.config/i3
cp configs/i3config ~/.config/i3/config

## Wallpaper copy

cp wall/8.png ~/8.png

## TLP

tlp start
