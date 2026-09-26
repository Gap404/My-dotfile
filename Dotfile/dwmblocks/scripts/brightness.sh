#!/usr/bin/env bash
# 屏幕亮度
if command -v brightnessctl >/dev/null 2>&1; then
	printf "BRI %s" "$(brightnessctl -m 2>/dev/null | cut -d, -f4)"
fi
