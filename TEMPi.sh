#!/bin/bash
# TEMPi - a CPU/GPU temperature logger for Raspberry Pi
# https://github.com/bmscmoreira/TEMPi/
# DEFINE PATH TO LOG FILE: change this to the desired location/filename.
file="$HOME/Desktop/TEMPi_log.txt"
# GET TEMPERATURES
cpu=$(</sys/class/thermal/thermal_zone0/temp)
gpu=$(/opt/vc/bin/vcgencmd measure_temp)
gpu=${gpu:5:6} # formatting GPU temperature output
# LOG TEMPERATURES TO FILE
echo "TEMPi log: $(date +%F_%T)|CPU:$((cpu/1000)).0'C|GPU:$gpu" >> $file