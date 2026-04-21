#!/bin/bash
# log-cleaner.sh - Remove log files older than N days
DIR="${1:-/var/log}"
DAYS="${2:-30}"
PATTERN="${3:-*.log}"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

echo "Cleaning $DIR/$PATTERN older than $DAYS days..."
find "$DIR" -name "$PATTERN" -type f -mtime +$DAYS -exec rm -v {} \;
echo "Done. Disk usage now:"
df -h "$DIR" | tail -1
