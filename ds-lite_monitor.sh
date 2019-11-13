#!/bin/bash

#purpose of this script os monitoring an ds-lite connection. It does this by creating
# a ssh conncetion to a server defined. ssh keybaased authentication must be enabled. 
# Of cource this server must as well be reachable via ipv6 and ipv4

CONFFILE="$HOME/.ds-lite_monitor.conf"


if [ -f "$CONFFILE" ]; then
	echo "Using config file $CONFFILE"
else
	echo "Config file created: $CONFFILE"
	echo "Please edit it"
	touch "$CONFFILE"
	echo "SSH_SERVER=''" >>$CONFFILE
	echo "REPORT_DIR=''" >>$CONFFILE
	exit 1
fi


#read config
. $CONFFILE
echo "Using server: $SSH_SERVER"
echo "Writing results to $REPORT_DIR"

mkdir -p "$REPORT_DIR"

V4_PID="9999999"
V6_PID="9999999"

while true
do
   ps x|grep -v grep|grep "$V4_PID" >/dev/null
   EXITCODE="$?"
   if [ "$EXITCODE" -gt 0 ]; then
   	   echo -n "$(date): (re)starting ssh 4 connection, "
  	  ./ssh_script.sh "$SSH_SERVER" "4" "$REPORT_DIR" >$REPORT_DIR/log_ssh_ipv4.txt 2>&1 &
  	  V4_PID="$!"
  	  echo "PID is $V4_PID"
   fi


  sleep 3
done	