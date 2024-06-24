#!/bin/bash

BACKUP_DIR="$HOME/kde-backup"
BACKUP_FILE="$BACKUP_DIR/kde-settings-backup-$(date +'%Y%m%d').tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" \
    ~/.config/plasma-org.kde.plasma.desktop-appletsrc \
    ~/.config/plasmashellrc \
    ~/.config/kdeglobals \
    ~/.config/kwinrc \
    ~/.config/kscreenlockerrc \
    ~/.config/ksmserverrc \
    ~/.config/kdeconnect/ \
    ~/.local/share/plasma/ \
    ~/.local/share/kactivitymanagerd/ \
    ~/.local/share/kded5/ \
    ~/.local/share/knewstuff3/

echo "Backup completed. File saved as $BACKUP_FILE"
