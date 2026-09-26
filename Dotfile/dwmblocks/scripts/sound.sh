#!/usr/bin/env bash
# 声音：默认 sink 音量，静音显示 MUTE
# 所有 pactl 调用都加硬超时，避免音频服务异常时脚本挂住、拖垮整个 dwmblocks

get_vol() {
	timeout 1 pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+(?=%)' | head -1
}

get_mute() {
	timeout 1 pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}'
}

if command -v pactl >/dev/null 2>&1; then
	vol=$(get_vol)
	# pactl 没立即返回就用 amixer 兜底
	if [ -z "$vol" ] && command -v amixer >/dev/null 2>&1; then
		vol=$(timeout 1 amixer get Master 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
	fi
	[ -z "$vol" ] && { echo ""; exit 0; }

	muted=$(get_mute)
	if [ "$muted" = "yes" ]; then
		printf "VOL MUTE"
	else
		printf "VOL %s%%" "$vol"
	fi
elif command -v amixer >/dev/null 2>&1; then
	vol=$(timeout 1 amixer get Master 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
	[ -n "$vol" ] && printf "VOL %s%%" "$vol"
fi
