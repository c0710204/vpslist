#!/bin/bash
cd /root/tools/vpslist/

host=`hostname`
ip=`curl -s http://whatismyip.akamai.com/`
mem=`free -h|grep Mem|awk "{print \\\$2}"`
cpu=`cat /proc/cpuinfo |grep processor|wc -l`
git pull
rm "$host_\*"
touch "[$host][$ip][$cpu][$mem]"
git add . --all
git commit -m autosync
git push
