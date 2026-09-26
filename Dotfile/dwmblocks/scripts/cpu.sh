#!/usr/bin/env bash
# CPU：总体占用率（两次采样）
read -r _ u1 n1 s1 i1 w1 irq1 sirq1 st1 _ < /proc/stat
prev_idle=$((i1 + w1))
prev_total=$((u1 + n1 + s1 + i1 + w1 + irq1 + sirq1 + st1))
sleep 0.3
read -r _ u2 n2 s2 i2 w2 irq2 sirq2 st2 _ < /proc/stat
idle=$((i2 + w2))
total=$((u2 + n2 + s2 + i2 + w2 + irq2 + sirq2 + st2))
dt=$((total - prev_total))
di=$((idle - prev_idle))
[ "$dt" -eq 0 ] && { echo "CPU 0%"; exit 0; }
printf "CPU %d%%" $(( (100 * (dt - di)) / dt ))
