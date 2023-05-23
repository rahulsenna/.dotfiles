#!/bin/bash
DATE=$(date +%d-%m-%Y)

SRC_DIR="/home/$USER"
BACKUP_DIR="$SRC_DIR/mnt/backup"
EXCLUDE="$SRC_DIR/mnt/*"

tar --exclude=$EXCLUDE --exclude=$SRC_DIR/.cache/yay*  --create --file=$BACKUP_DIR/agent-$DATE.tar  --listed-incremental=$BACKUP_DIR/agent.snar --absolute-names $SRC_DIR
# tar  --create --verbose --file=/mnt/data/documents1.tar --listed-incremental=/mnt/data/documents.snar  ~/Documents
