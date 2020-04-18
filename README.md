# TEMPi
A temperature logger for Raspberry Pi.

### Why
The Raspberry Pi packs a lot of power, when compared to its predecessors, in a small form-factor. Each use-case scenario is unique as so is the need to dissipate the heat it produces, either with active or passive cooling solutions. Either way, you can't improve what you can't measure, and this simple script allows you to do that: log the Rasperry Pi's temperature to a file.

Just a few hours logging temperature allowed me to notice that:
- my Raspberry Pi 4 in a closed acrilic case, with just a small gap for ventilation, stabilized at 54C, at idle;
- same case with the top cover removed and the temperature lowered to 49C, idling as well;
- deactivating VNC protocol or booting to CLI instead of desktop made no difference in the temperature;
- elevating the Pi, for fresh air to have more room to come in from below the Pi made no difference in temperature as well;
- placing the Pi sideways, with the I/O ports facing up, prevented the Pi from accumulating heat from below and allowed a better airflow and cooling: temperature dropped 2 degrees to 47C;
- adding an aluminium heatsink (passive solution - no fans) lowered idle temps to 39.

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
and append the following line (adapting it to your linux user / script path) in the end of the file:
```
* * * * * /home/pi/Desktop/TEMPi.sh
```

### Content of the script
```
#!/bin/bash
# TEMPi - a temperature logger for Raspberry Pi
# https://github.com/bmscmoreira/TEMPi/
# DEFINE PATH TO LOG FILE: change this to the desired location/filename.
file="$HOME/Desktop/TEMPi_log.txt"
# GET TEMPERATURE
temp=$(</sys/class/thermal/thermal_zone0/temp)
# LOG TEMPERATURE TO FILE
echo "TEMPi log: $(date +%F_%T)|TEMP:$((temp/1000)).0'C" >> $file
```

### The result
TEMPi will write the temperatures to the specified file with the following syntax:
```
TEMPi log: 2020-04-11_22:30:01|TEMP:54.0'C
TEMPi log: 2020-04-11_22:31:01|TEMP:53.0'C
TEMPi log: 2020-04-11_22:32:01|TEMP:54.0'C
(...)
```

### Future work
Plotting a graph with the temperatures, maybe using [matplotlib](https://matplotlib.org).
