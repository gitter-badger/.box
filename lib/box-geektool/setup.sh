BOXLIB="$HOME/.box/lib/box-geektool"

echo "CodeRonin";

hour=`date "+%l:%M %p" | cut -d ':' -f 1`
if [[ $hour -gt 9 ]]; 
then
	date "+%I:%M %p"
else
	date "+%l:%M %p" | cut -d ' ' -f 2-3
fi

date "+%A, %B %d, %Y"

IP=`curl http://checkip.dyndns.org | cut -d ':' -f 2 | cut -d '<' -f 1 | cut -d ' ' -f 2`
echo $IP
echo $IP > $BOXLIB/IP.txt

ipconfig getifaddr en0

top -l 1 | awk '/CPU usage/ {print $1 " " $2" " $3" "$4" "$5" "$6" "$7" "$8}' ;

THEN=$(sysctl kern.boottime | awk '{print $5}' | sed "s/,//")
NOW=$(date +%s)
DIFF=$(($NOW-$THEN))

DAYS=$(($DIFF/86400));
DIFF=$(($DIFF-($DAYS*86400)))
HOURS=$(($DIFF/3600))
DIFF=$(($DIFF-($HOURS*3600)))
MINUTES=$(($DIFF/60))

function format {
  if [ $1 == 1 ]; then
  	echo $1 ' ' $2
  elif [ $1 == 0 ]; then
  	echo ''
  else
  	echo $1 ' ' $2's'
  fi
}

UPTIME=$(echo `format $DAYS "day"` `format $HOURS "hour"` `format $MINUTES "minute"` | sed 's/^ *//')
echo "System uptime: $UPTIME"

my_ac_adapt=`ioreg -w0 -l | grep ExternalConnected | awk '{print $5}'`
if [ "$my_ac_adapt" == "Yes" ]
then
    echo "Power: External"
else
    cur_power=`ioreg -w0 -l | grep CurrentCapacity | awk '{print $5}'`
    max_power=`ioreg -w0 -l | grep MaxCapacity | awk '{print $5}'`
    bat_percent=`echo "scale=2;$cur_power / $max_power" | bc`
    bat_percent=`echo "$bat_percent * 100" | bc | sed 's/.00//'`
    echo "Power: Battery ($bat_percent%)"
fi

osascript $HOME/Dropbox/Developer/GeekTool/Position.scpt

raw=`curl http://www.brainyquote.com/link/quotebr.js`
quote=`echo $raw | cut -d '"' -f 4 | cut -d '<' -f 1`
author=`echo $raw | cut -d '>' -f 6 | cut -d '<' -f 1`
echo $quote
echo '												 - '$author