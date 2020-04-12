#!/bin/bash
# TEMPi - a temperature logger for Raspberry Pi
# https://github.com/bmscmoreira/TEMPi/
# DEFINE PATH TO LOG FILE: change this to the desired location/filename.
file="$HOME/Desktop/TEMPi_log.txt"
# GET TEMPERATURE
temp=$(</sys/class/thermal/thermal_zone0/temp)
# LOG TEMPERATURE TO FILE
echo "TEMPi log: $(date +%F_%T)|TEMP:$((temp/1000)).0'C" >> $file