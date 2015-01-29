for i in $(seq 1 5000); do
  echo $i
  bat -C hw:broadwellrt286,0 -a -p 2 -c 2
  #arecord -D hw:1,4 -f dat -d 1 test.wav > /dev/null
  if [ $? -ne 0 ]; then
    echo $? "record failed!"
    #dmesg
    #break
  fi
  bat -P hw:broadwellrt286,0 -b -p 2 -c 2
  #aplay -D hw:1,0 -f dat -d 1 /dev/zero
  if [ $? -ne 0 ]; then
    echo $? "play failed!"
    #dmesg
    #break
  fi
done
