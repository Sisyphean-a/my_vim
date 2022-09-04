#!/bin/sh
num=$(ls /usr/bin | grep -wc pacman)
pa=pacman
echo $num
if (($num>=0)); then
	pacman -Syu	
fi
