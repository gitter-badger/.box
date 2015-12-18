#! /bin/sh
# 2006 Beerguy's Reef - www.hopdog.com

for nic in $(ifconfig -a | grep ^en | awk '-F:' '{print $1}'); do
	/sbin/ifconfig "$nic" > /tmp/if-stat
	addr=$(cat /tmp/if-stat | grep 'inet ' | awk '-F ' '{print $2}')
	speed=$(cat /tmp/if-stat | grep 'media' | awk '-F: ' '{print $2" "$3}'| head -1)

	if [ "$addr" ]
	  then
		echo "$nic: $addr $speed"
	fi
	rm /tmp/if-stat
done