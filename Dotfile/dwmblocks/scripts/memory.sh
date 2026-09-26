#!/usr/bin/env bash
# 内存：已用/总量
free -h | awk '/^Mem:/ {gsub(/i/,"",$3); gsub(/i/,"",$2); print "MEM " $3 "/" $2}'
