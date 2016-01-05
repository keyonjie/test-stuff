
cd /sys/bus/platform/drivers/broadwell-audio/
echo broadwell-audio > unbind
cd /home/test/
rmmod snd_soc_sst_broadwell
rmmod snd_soc_rt286
cd /sys/bus/platform/drivers/haswell-pcm-audio/
echo haswell-pcm-audio > unbind
cd /home/test/
rmmod snd_soc_sst_haswell_pcm
#rmmod snd_soc_sst_ipc
#rmmod snd_soc_sst_dsp
rmmod snd_soc_sst_acpi

insmod /lib/modules/4.1.0-rc8+/kernel/sound/soc/intel/common/snd-soc-sst-acpi.ko

