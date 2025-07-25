set -e

# Simple script to Enable cpu/gpu throttling. Work in progress.
# Usage:
# sudo ./mbpfreq-switch.sh {ac, bat, video, underclock}
#

MODE=$1

HIGH_FREQ="3.1GHz"
LOW_FREQ="2.2GHz"
LOWEST_FREQ="1.2GHz"
PERF_SCHED="schedutil"
BAT_SCHED="conservative"


case $MODE in

    ac)
    cpupower -c 0-3 frequency-set -g $PERF_SCHED
    cpupower -c 0-3 frequency-set -u $HIGH_FREQ
    intel_gpu_frequency -d
    cpupower -c 0 frequency-info | grep "current policy"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    exit 0
    ;;

    bat)
    cpupower -c 0-3 frequency-set -g $BAT_SCHED
    cpupower -c 0-3 frequency-set -u $LOW_FREQ
    intel_gpu_frequency --custom max=750
    cpupower -c 0 frequency-info | grep "current policy"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    exit 0
    ;;

    video)
    cpupower -c 0-3 frequency-set -g $BAT_SCHED
    cpupower -c 0-3 frequency-set -u $LOW_FREQ
    intel_gpu_frequency --custom max=800
    cpupower -c 0 frequency-info | grep "current policy"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    exit 0
    ;;

    underclock)
    cpupower -c 0-3 frequency-set -g $BAT_SCHED
    cpupower -c 0-3 frequency-set -u $LOWEST_FREQ
    intel_gpu_frequency --custom max=200
    cpupower -c 0 frequency-info | grep "current policy"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    exit 0
    ;;

    *)
    echo "unknown mode. Available modes: ac, bat, video, underclock"
    exit 1
    ;;
esac
