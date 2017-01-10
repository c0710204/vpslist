#!/bin/bash
git pull
ip=`curl -s http://whatismyip.akamai.com/`
mem=`free -h|grep Mem|awk "{print \\\$2}"`
cpu=`cat /proc/cpuinfo |grep processor|wc -l`
touch "$ip-$cpu-$mem"
git add . --all
git commit -m autosync
git push
