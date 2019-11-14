#!/bin/bash

SERVER=$1
IP_MODE=$2
REPORTDIR=$3

STARTTIMEH=$(date +%Y%m%d_%H%M%S)
STARTTIME=$(date +%s)
while true
do
    echo "echo Connected"
    
    sleep 10
done | ssh "-t" "-$IP_MODE" "$SERVER" "bash -l"

ENDTIME=$(date +%s)
ENDDTIMEH=$(date +%Y%m%d_%H%M%S)

RUNTIME=$[$ENDTIME - $STARTTIME] 

echo "$STARTTIMEH; $ENDDTIMEH; $IP_MODE; $RUNTIME" |tee -a "$REPORTDIR/ip_v$IP_MODE.txt"
