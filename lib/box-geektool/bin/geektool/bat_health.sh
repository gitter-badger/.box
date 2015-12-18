#!/bin/sh

health=`ioreg -w0 -l | grep Capacity | tr '\n' ' | ' | awk '{print int($5/$21*100)}'`
typeset -i b=9
echo "Batt Health \c"
while [ $b -lt $health ]
do
	echo "\033[1;37m▇\033[0m\c"
	b=`expr $b + 10`
done
#echo "\033[1;39m█\033[0m\c"
while [ $b -lt 99 ]
do
	echo "\033[2;30m▇\033[0m\c"

	b=`expr $b + 9`
done
echo "	$health%\c"

echo "\r"
unset bat
unset b

