#!/bin/sh
num=$(ls /usr/bin | grep -wc pip)
echo $num
if (($num>=0)); then
	echo "hello world"
fi
