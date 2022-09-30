#!/bin/bash

mkdir $HOME/.config

# Configure stuff

## xorg

#touch $HOME/.xinitrc
#echo 'exec i3' >> $HOME/.xinitrc

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

## Alacritty

mkdir ~/.config/alacritty
cp configs/alacritty.yml ~/.config/alacritty/

## i3

mkdir ~/.config/i3
cp configs/i3config ~/.config/i3/config

## Wallpaper copy

cp wall/8.png ~/8.png

## TLP

#cp configs/tlp.conf /etc/tlp.conf
#tlp start

# Prepare dirs

mkdir ~/doc
mkdir ~/doc/{arc,pic}
mkdir ~/tmp
mkdir ~/art
mkdir ~/art/{mus,mov,pic}


## END: Print things to manually take care of:
