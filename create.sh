#!/bin/bash

BACKUP_DIR="$HOME/plasma-backup"
BACKUP_FILE="$BACKUP_DIR/plasma-settings-backup-$(date +'%Y%m%d').tar.gz"

mkdir -p "$BACKUP_DIR"

CONFIG_FILES=(
    "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
    "$HOME/.config/plasmashellrc"
    "$HOME/.config/kdeglobals"
    "$HOME/.config/kwinrc"
    "$HOME/.config/kscreenlockerrc"
    "$HOME/.config/ksmserverrc"
    "$HOME/.config/kdeconnect/"
    "$HOME/.local/share/plasma/"
    "$HOME/.local/share/kactivitymanagerd/"
    "$HOME/.local/share/kded5/"
    "$HOME/.local/share/knewstuff3/"
)

# Check if each configuration file/directory exists and create a list of existing ones
EXISTING_FILES=()
for FILE in "${CONFIG_FILES[@]}"; do
    if [ -e "$FILE" ]; then
        EXISTING_FILES+=("$FILE")
    else
        echo "Warning: $FILE does not exist and will not be included in the backup."
    fi
done

# Create a tarball of the existing plasma settings
if [ ${#EXISTING_FILES[@]} -gt 0 ]; then
    tar -czf "$BACKUP_FILE" "${EXISTING_FILES[@]}"
    echo "Backup completed. File saved as $BACKUP_FILE"
else
    echo "Error: No configuration files found to back up."
    exit 1
fi
