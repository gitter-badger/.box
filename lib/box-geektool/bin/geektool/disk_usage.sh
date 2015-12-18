#!/bin/sh
#getting disks..due to better handling with awk it creates a file
df -H | grep -vE '^Filesystem|tmpfs|cdrom|devfs|map|disk2' | awk '{ print $1 " " $5 }' >> /tmp/disks.lst
#how many disks do we have?
count=`wc -l tmp/disks.lst|awk '{print $1}'`
for ((i=1;i <= $count;i++))
do
currname=`awk -v i=$i 'NR==i' tmp/disks.lst|awk '{print $1}'`
echo "$currname\t\c"
currp=`awk -v i=$i 'NR==i' tmp/disks.lst|awk '{print $2}'|cut -d'%' -f1`
rm tmp/disks.lst

typeset -i a=9
while [ $a -lt $currp ]
do
	echo "\033[1;37m▇\033[0m\c"
	a=`expr $a + 10`
done
#echo "\033[1;39m█\033[0m\c"

while [ $a -lt 99 ]
do
	echo "\033[2;30m▇\033[0m\c"
	a=`expr $a + 10`
done
echo "  $currp%\c"
echo "\r"
done

unset count
unset i
unset currname
unset currp
unset a