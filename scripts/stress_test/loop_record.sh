#!/bin/bash

date > loop_c.log;
#while true; do 
for i in $(seq 1 5000); do
	cmd="arecord -D hw:broadwellrt286,0 -f dat /tmp/foo.wav -d 2"; 
	echo $i >> loop_c.log;
	echo $cmd;
	$cmd;
done
