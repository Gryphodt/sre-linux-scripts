#!/bin/bash
BACKUP_DIR="$1"
KEEP="${2:-7}"
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: Directory $BACKUP_DIR does not exist."
    exit 1
fi
echo "Keeping only the last $KEEP backups in $BACKUP_DIR"
ls -1t "$BACKUP_DIR" | tail -n +$((KEEP+1)) | while read -r file; do
    echo "Removing old backup: $file"
    rm -f "$BACKUP_DIR/$file"
done
ls -lh "$BACKUP_DIR"
