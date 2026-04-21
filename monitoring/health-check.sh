#!/bin/bash
CPU_THRESHOLD=90
MEM_THRESHOLD=90
DISK_THRESHOLD=85

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "=== Health Report ==="
echo "CPU:  ${CPU_USAGE}%"
echo "RAM:  ${MEM_USAGE}%"
echo "Disk: ${DISK_USAGE}%"

[ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ] && echo "WARNING: CPU above $CPU_THRESHOLD%"
[ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ] && echo "WARNING: Memory above $MEM_THRESHOLD%"
[ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ] && echo "WARNING: Disk above $DISK_THRESHOLD%"
