#!/bin/bash

ARG_1=$1
ARG_M=$#
count=0

function kill_shutdown {
tm=$(ps -a |grep transmission|cut -c 1-5)
kill -9 $tm
echo "killing transmission"
sleep 5	  
init 0
  }

if [ -z $ARG_1 ];then
	echo "Need one filename for argument at the least!"
	exit 1
fi



while [ "1" ];do
 
for  ARG in "$@";do
if [ -e $ARG ];then
	count=$(( count + 1 ))
fi
done

if (( count < $# ));then
	count=0
	echo "downloading....."
	sleep 300
else
	kill_shutdown
fi

done

