#!/bin/bash
cp -r ../vim ~/.vim
cp ../configs/vimrc ~/.vimrc
mkdir ~/.config
mkdir ~/.config/nvim
cp ../configs/init.vim ~/.config/nvim/
mkdir ~/.config/fish
cp ../configs/config.fish ~/.config/fish/

echo 'Set default shell in either:'
echo '- .bashrc'
echo '- MacOS advanced user settings'
echo '- in /etc/passwd'
