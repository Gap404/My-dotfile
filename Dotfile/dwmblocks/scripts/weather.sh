#!/usr/bin/env bash
# 天气：天气缩写 + 温度 + 天气名称
# 数据源：wttr.in
# 修改位置：改下面的 LOCATION 变量
#   支持城市名（Meizhou）或精确经纬度（23.95,116.20）
#   当前：广东省梅州市丰顺县丰良镇
LOCATION="23.95246,116.20204"
CACHE="/tmp/dwmblocks-weather.cache"
CACHE_TTL=600   # 缓存 10 分钟，避免频繁请求

# --- 有缓存且未过期则直接输出 ---
if [ -f "$CACHE" ]; then
	now=$(date +%s)
	mtime=$(stat -c %Y "$CACHE" 2>/dev/null || echo 0)
	if [ $((now - mtime)) -lt "$CACHE_TTL" ]; then
		cat "$CACHE"
		exit 0
	fi
fi

# --- 获取数据 ---
json=$(timeout 10 curl -s "https://wttr.in/${LOCATION}?format=j1" 2>/dev/null)
[ -z "$json" ] && { cat "$CACHE" 2>/dev/null; exit 0; }

code=$(printf '%s' "$json" | jq -r '.current_condition[0].weatherCode // empty' 2>/dev/null)
temp=$(printf '%s' "$json" | jq -r '.current_condition[0].temp_C // empty' 2>/dev/null)
desc=$(printf '%s' "$json" | jq -r '.current_condition[0].weatherDesc[0].value // empty' 2>/dev/null)

[ -z "$temp" ] && { cat "$CACHE" 2>/dev/null; exit 0; }

# --- WW 天气代码 → 缩写 ---
case "$code" in
	113) abbr="SUN"  ;;   # 晴
	116) abbr="PCLD" ;;   # 局部多云
	119|122) abbr="CLD" ;; # 阴/多云
	143|248|260) abbr="FOG" ;; # 雾
	176|263|266|293|296|353) abbr="RAIN" ;; # 零星雨/毛毛雨/小雨
	299|302|305|308|356|359) abbr="RAIN" ;; # 中雨/大雨/暴雨
	200|386|389|392|395) abbr="TSTM" ;; # 雷雨
	179|182|185|281|284|311|314|317|320|350|362|365|374|377) abbr="SLT" ;; # 雨夹雪/冻雨
	227|230|320|323|326|329|332|335|338|368|371) abbr="SNOW" ;; # 雪
	*) abbr="WTHR" ;;
esac

result="${abbr} ${temp}°C ${desc}"
printf '%s' "$result"
printf '%s' "$result" > "$CACHE" 2>/dev/null
