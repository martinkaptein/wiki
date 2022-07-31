#!/bin/bash

# Update pacman

sudo pacman -Syyu --noconfirm

# Install all required programs from list

sudo cat archlist.txt | xargs pacman -S --noconfirm

# Configure stuff

mkdir $HOME/.config

## xorg

touch $HOME/.xinitrc
echo 'exec i3' >> $HOME/.xinitrc

## vim and nvim

cp -r vim $HOME/.vim
cp configs/vimrc $HOME/.vimrc
mkdir ~/.config/nvim
cp configs/init.vim ~/.config/nvim/

## bash

touch $HOME/.profile
touch $HOME/.bashrc
echo 'fish' >> $HOME/.profile
echo 'fish' >> $HOME/.bashrc

## fish

mkdir $HOME/.config/fish
cp configs/config.fish.arch $HOME/.config/fish/config.fish

## UFW

sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

## Alacritty

mkdir ~/.config/alacritty
cp configs/alacritty.yml ~/.config/alacritty/

## Cups

sudo systemctl enable cups.service
sudo systemctl start cups.service

## i3

mkdir ~/.config/i3
cp configs/i3config ~/.config/i3/config

## Wallpaper copy

cp wall/8.png ~/8.png

## TLP

#cp configs/tlp.conf /etc/tlp.conf
#tlp start

## PDBX init

mkdir $HOME/pdb
mkdir $HOME/pdb/bak

# Prepare other dirs

mkdir ~/arc
mkdir ~/tmp
mkdir ~/git

## Bluetooth

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

## Finder Script

sudo cp scripts/open.sh /usr/local/bin/fzfinder
sudo chmod +x /usr/local/bin/fzfinder

## END: Print things to manually take care of:
