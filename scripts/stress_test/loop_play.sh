#!/bin/bash

date > loop_p.log;
c=;
#while true; do 
for i in $(seq 1 5000); do
	if [ -z $c ]; then 
	left=1000; right=0; c=1; 
	else left=0; right=1000; c=; 
	fi;
	cmd="aplay -D hw:broadwellrt286,0 -f dat -d 3 /dev/zero";
	#cmd="sox -b 16 -n -t alsa hw:0,0 synth 3 sine $left sine $right";
	echo $i >> loop_p.log;
	echo $cmd;
	$cmd; 
done
