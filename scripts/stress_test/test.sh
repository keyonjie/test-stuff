for i in $(seq 1 20000); do
  echo $i
  arecord -D hw:broadwellrt286,0 -f dat -d 1 test.wav > /dev/null
  if [ $? -ne 0 ]; then
    echo $? "record failed!"
    #dmesg
    #break
  fi
  aplay -D hw:broadwellrt286,0 -f dat -d 1 /dev/zero
  if [ $? -ne 0 ]; then
    echo $? "play failed!"
    #dmesg
    #break
  fi
done
