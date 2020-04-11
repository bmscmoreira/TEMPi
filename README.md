# TEMPi
A CPU/GPU temperature logger for Raspberry Pi.

The Raspberry Pi packs a lot of power, when compared to its predecessors, in a small form-factor. Each use-case scenario is unique as so is the need to dissipate the heat it produces, either with active or passive cooling solutions. Either way, you can't improve what you can't measure, and this simple script allows you to do that: log the Rasperry Pi's CPU and GPU temperature to a file.

Just a few hours logging temperature allowed me to notice that:
- my Pi in a closed acrilic case, with just a small gap for ventilation, stabilized at 54CPU/54GPU celsius, at idle;
- same case with the top cover removed and the temperatures lowered to 49CPU/48GPU celsius, idling as well;
- deactivating VNC protocol or booting to CLI instead of desktop made no difference in the temps;
- elevating the Pi, for fresh air to have more room to come in from beneath the Pi made no difference in temps as well.

###How to use this script:
