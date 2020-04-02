#!/bin/bash
cwd=$(pwd)
cd
path=$(fzf)
dir=$(dirname "$path")
echo "$path"
printf "\n"
echo "Press 'd' to change directory to" 
echo "Press 't' to open with GUI explorer" 
echo "Press 'v' to open with vim" 
echo "Press 'e' to explore with vim" 
echo "Press 'o' to open with default" 
echo "Press 'q' to quit"
while :
do
read -n 1 a
case $a in
	d* )	cd $dir && exec fish;;
	t* )	Thunar $dir;;
	v* )	vim $path;;
	e* )	vim $dir;;
	o* )	xdg-open $path;;
	q* ) 	exit 0;;
esac
exit 0
done
