#!/usr/bin/env bash
# 电量：BAT0/BAT1 取平均，充电显示 + 号
sum=0; n=0
for b in /sys/class/power_supply/BAT*; do
	[ -r "$b/capacity" ] || continue
	sum=$((sum + $(cat "$b/capacity"))); n=$((n + 1))
done
[ "$n" -eq 0 ] && { echo "BAT N/A"; exit 0; }
pct=$((sum / n))

mark=""
for b in /sys/class/power_supply/BAT*; do
	[ -r "$b/status" ] || continue
	case "$(cat "$b/status")" in
		Charging) mark="+"; break ;;
		Full)     mark="="; break ;;
	esac
done
#printf "BAT %s%%%s" "$pct" "$mark"
echo "BAT ${pct}$mark"
