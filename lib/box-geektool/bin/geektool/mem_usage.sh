#!/bin/sh

myUsedMemM=`top -l 1 | awk '/PhysMem/ {print $2}' | sed s/M// `
myUsedMemG=`top -l 1 | awk '/PhysMem/ {print $2}' | sed s/G// `
if [ $myUsedMemG ]
  then
	myUsedMem=$(($myUsedMemG * 1000))
fi

myFreeMem=`top -l 1 | awk '/PhysMem/ {print $6}' | sed s/M// `
myTotalMem=` expr $myUsedMem + $myFreeMem`
myUsedPer=`echo $myFreeMem $myTotalMem | awk '{print int(100-$1/$2*100)}'`

typeset -i c=9
echo "RAM\t\t\c"
while [ $c -lt $myUsedPer ]
do
	echo "\033[1;37m▇\033[0m\c"
	c=`expr $c + 10`
done
#echo "\033[1;39m█\033[0m\c"

while [ $c -lt 99 ]
do
	echo "\033[2;30m▇\033[0m\c"
	c=`expr $c + 10`
done
echo "  $myUsedPer%\c"

unset myUsedMemM
unset myUsedMemG
unset myUsedMem
unset myFreeMem
unset myTotalMem
unset myUsedPer
unset c