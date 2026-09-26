#!/usr/bin/env bash
# 硬盘：根分区使用率
df -h / | awk 'NR==2 {print "DISK " $5}'
