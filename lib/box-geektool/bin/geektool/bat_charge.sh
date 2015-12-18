#!/bin/sh

bat=`ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{print int($10/$5*100)}'`
typeset -i b=9
echo "BATT\t\t\c"
while [ $b -lt $bat ]
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
echo "  $bat%\c"
unset bat
unset b
