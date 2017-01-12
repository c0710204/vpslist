#!/bin/bash
cd /root/tools/vpslist/
git pull

host=`hostname`
ip=`curl -s http://whatismyip.akamai.com/`
mem=`free -h|grep Mem|awk "{print \\\$2}"`
cpu=`cat /proc/cpuinfo |grep processor|wc -l`
rm "$host_\*"
touch "$host_$ip_$cpu_$mem"
git add . --all
git commit -m autosync
git push
