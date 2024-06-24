#!/bin/bash

function error_exit {
    echo "Error: $1"
    exit 1
}

read -p "Please enter the path to the backup file (tar.gz): " BACKUP_FILE


if [ -z "$BACKUP_FILE" ]; then
    error_exit "No backup file path provided."
fi


if [ ! -f "$BACKUP_FILE" ]; then
    error_exit "Backup file $BACKUP_FILE does not exist."
fi


tar -xzf "$BACKUP_FILE" -C "$HOME"

if [ $? -eq 0 ]; then
    echo "Restoration completed from $BACKUP_FILE"
else
    error_exit "Failed to restore from $BACKUP_FILE"
fi
