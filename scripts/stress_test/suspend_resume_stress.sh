
for i in $(seq 1 500); do
  echo $i
  rtcwake -m mem -s 10;
  sleep 5;
  if [ $? -ne 0 ]; then
    echo "S3 failed!"
    #dmesg
    break
  fi
done
