# mbp-scripts
Scripts to manage thermals and power on a Macbook pro late 2013 with Endeavour OS/Arch


## mbpfreq-switch

A simple script to Enable cpu/gpu throttling. Work in progress. Use at your own risk.
Uses `cpupower` and `intel_gpu_frequency` to throttle the CPU and GPU. 

Ensure the utilities are installed and run as following:

`sudo ./mbpfreq-switch.sh {ac, bat, video, underclock}`

Not much difference between modes, except in the peak frequencies for CPU and GPU for the type of use:
- `ac` has a higher - but not maximum for the CPU - clock
- `video` has a higher GPU clock
- `bat` a more conservative clock
- `underclock` the lowest bearable clock
