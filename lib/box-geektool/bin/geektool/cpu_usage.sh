#!/bin/sh

myCPU=`top -l 1 | awk '/CPU usage/ {print $3}' | sed s/%//`
myCPU=`echo "tmp=$myCPU; tmp /= 1; tmp" | bc`

typeset -i b=9

echo "CPU\t\t\c"
while [ $b -lt $myCPU ]
do
	echo "\033[1;37m▇\033[0m\c"
	b=`expr $b + 10`
done
#echo "\033[1;39m█\033[0m\c"

while [ $b -lt 99 ]
do
	echo "\033[2;30m▇\033[0m\c"
	b=`expr $b + 10`
done
echo "  $myCPU%\c"

unset myCPU
unset b
