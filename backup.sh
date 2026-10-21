#!/bin/bash

WEB_DIR="/var/www/html"
BACKUP_DIR="$HOME/DevOps-Fundamentals-Project/Backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/website-backup-$TIMESTAMP.tar.gz"

if [ ! -d "$WEB_DIR" ]; then
    echo "ERROR: Website directory $WEB_DIR does not exist."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

if sudo tar -czf "$BACKUP_FILE" -C "$WEB_DIR" .; then
    echo "Website backup created successfully."
    echo "Backup file: $BACKUP_FILE"
else
    echo "ERROR: Backup failed."
    rm -f "$BACKUP_FILE"
    exit 1
fi
