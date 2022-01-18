#!/bin/bash

MONITOR_CACHE=/opt/parental-control # location of monitor cahe
PROCESSES="minecraft civilization"  # processes to limit time for
CAP=210                             # combined allowed time (minutes) for processes

function monitor_process(){
  COUNT=$(ps aux | grep -i $1 | grep -v grep | wc -l)
  echo "monitor_process() $1 $2 $3 yields COUNT = $COUNT"
  if [ $COUNT -gt 0 ]; then
    touch $MONITOR_CACHE/$2/$3
  fi
}

while [ 1 -lt 2 ]; do
  DATE=$(date '+%Y-%m-%d')
  mkdir -p $MONITOR_CACHE/$DATE
  SECS=$(date +%s)

  for f in $(echo $PROCESSES); do
    monitor_process $f $DATE $SECS
  done

  N=$(find $MONITOR_CACHE/$DATE | wc -l)
  if [ $N -gt $CAP ]; then
    shutdown -h 0 
  fi
  echo "N = $N CAP = $CAP"
  sleep 60
done

