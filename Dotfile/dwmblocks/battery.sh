#!/usr/bin/env bash
C0=$(cat /sys/class/power_supply/BAT0/capacity)
C1=$(cat /sys/class/power_supply/BAT1/capacity)
echo "BAT:$(((${C0}+${C1})/2))%"
