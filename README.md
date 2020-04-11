# TEMPi
A CPU/GPU temperature logger for Raspberry Pi.

### Why

The Raspberry Pi packs a lot of power, when compared to its predecessors, in a small form-factor. Each use-case scenario is unique as so is the need to dissipate the heat it produces, either with active or passive cooling solutions. Either way, you can't improve what you can't measure, and this simple script allows you to do that: log the Rasperry Pi's CPU and GPU temperature to a file.

Just a few hours logging temperature allowed me to notice that:
- my Raspberry Pi 4 in a closed acrilic case, with just a small gap for ventilation, stabilized at 54CPU/54GPU celsius, at idle;
- same case with the top cover removed and the temperatures lowered to 49CPU/48GPU celsius, idling as well;
- deactivating VNC protocol or booting to CLI instead of desktop made no difference in the temps;
- elevating the Pi, for fresh air to have more room to come in from beneath the Pi made no difference in temps as well.

### How to use this script:

- download TEMPi.sh script and place it at a convenient location (for example, in your desktop);
- edit TEMPi.sh and change the location and filename desired for the log file;
```
# DEFINE PATH TO LOG FILE: change this to the desired location/filename.
file="$HOME/Desktop/TEMPi_log.txt"
```
- make the script executable;
```
chmod +x TEMPi.sh
```
- add the script to CRON for it to execute automatically at given intervals: if you want it to run every minute, open crontab in the terminal
```
$ crontab -e
```
and append the following line in the end of the file:
```
* * * * * /home/pi/Desktop/TEMPi.sh
```
### Content of the script
```
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
```

### The result
TEMPi will write to the specified file the CPU/GPU temperatures with this syntax:
```
TEMPi log: 2020-04-11_22:30:01|CPU:54.0'C|GPU:54.0'C
TEMPi log: 2020-04-11_22:31:01|CPU:53.0'C|GPU:54.0'C
TEMPi log: 2020-04-11_22:32:01|CPU:54.0'C|GPU:55.0'C
(...)
```

### Future work
Plotting a graph with the temperatures, maybe using [matplotlib](https://matplotlib.org).
