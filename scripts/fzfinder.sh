#!/bin/bash
cwd=$(pwd)
cd ~/
path=$(fzf)
#path=$(echo $fzf | sed "s/\s/\\\\ /g")
dir=$(dirname "$path")
#dir=$(echo $dir | sed "s/\s/\\\\ /g")
echo $fzf
echo $dir
echo $path
printf "\n"
echo "Press 'd' to change directory to" 
echo "Press 't' to open with GUI explorer" 
echo "Press 'v' to open with nvim" 
echo "Press 'e' to explore with ranger" 
echo "Press 'o' to open with default" 
echo "Press 'm' to open with mpv" 
echo "Press 'q' to quit"
while :
do
read -n 1 a
case $a in
	d* )	cd "$dir" && exec fish;;
	t* )	Thunar "$dir";;
	v* )	nvim "$path";;
	r* )	ranger "$dir";;
	o* )	xdg-open $path;;
	m* )	mpv "$path";;
	q* ) 	exit 0;;
esac
exit 0
done
