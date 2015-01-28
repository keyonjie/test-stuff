#!/bin/bash
for i in $(seq 1 30000); do
	python dump_fw.py "fw_dump_file" /sys/kernel/debug/intel_adsp/mem
	sleep 1
done
