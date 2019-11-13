#!/bin/bash


for i in $(ps xa|grep -v "grep"|grep "ds-lite_monitor.sh"|cut -d " " -f 1)
do
	echo "Killing $i"
	kill $i
done
for i in $(ps xa|grep -v "grep"|grep ssh_script|cut -d " " -f 1)
do
	echo "Killing $i"
	kill $i
done
for i in $(ps xa|grep -v "grep"|grep "ssh -4"|cut -d " " -f 1)
do
	echo "Killing $i"
	kill $i
done
for i in $(ps xa|grep -v "grep"|grep "ssh -5"|cut -d " " -f 1)
do
	echo "Killing $i"
	kill $i
done


ps xa|grep -v "grep"|grep ssh
ps xa|grep -v "grep"|grep ds-lite
