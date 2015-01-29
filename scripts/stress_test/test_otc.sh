date > test.log
for i in $(seq 1 15000); do
  echo $i >> test.log
  echo $i
  arecord -D hw:broadwellrt286,0 -f dat -d 1 > /dev/null
  if [ $? -ne 0 ]; then
    echo "record failed!" >> test.log
    echo "record failed!"
#    python dump_fw.py "fw_mem_dump_file_for_record_$i" /sys/kernel/debug/intel_adsp/mem
#    dmesg > $i.dmesg
    break
  fi
  aplay -D hw:broadwellrt286,0 -f dat -d 1 /dev/zero
  if [ $? -ne 0 ]; then
    echo "play failed!" >> test.log
    echo "play failed!"
#    python dump_fw.py "fw_mem_dump_file_for_play_$i" /sys/kernel/debug/intel_adsp/mem
#    dmesg > $i.dmesg
    break
  fi
  #dmesg
done
