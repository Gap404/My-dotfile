#!/usr/bin/env bash
# 网络：内网 IP + 是否翻墙
# 翻墙判断：Clash 代理端口(7890)是否监听；未监听则查出口 IP 国家是否为 CN

# --- 内网 IP（排除 lo 和 Clash TUN 的 198.18.x.x）---
ip=""
for dev in $(ip -4 -o addr show scope global 2>/dev/null | awk '{print $2}'); do
	addr=$(ip -4 -o addr show dev "$dev" 2>/dev/null | awk '{print $4}' | cut -d/ -f1)
	case "$addr" in
		198.18.*|198.19.*) continue ;;   # Clash TUN
		"") continue ;;
	esac
	ip="$addr"
	break
done
[ -z "$ip" ] && ip="无IP"

# --- 翻墙状态 ---
vpn="OFF"
if ss -tln 2>/dev/null | grep -q '127.0.0.1:7890'; then
	vpn="ON"
else
	# 端口没开，再看出口国家是否非 CN
	country=$(timeout 4 curl -s https://ipinfo.io/country 2>/dev/null)
	[ -n "$country" ] && [ "$country" != "CN" ] && vpn="ON"
fi

printf "NET %s %s" "$ip" "$vpn"
