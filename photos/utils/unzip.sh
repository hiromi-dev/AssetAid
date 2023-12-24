#!/bin/bash

SOURCE_DIR="/Users/fukudahiromumi/photos/temp/zip/"

PHOTOS_DIR_NAME="extracted_photos"

for zip_file in "$SOURCE_DIR"/*.zip; do
    if [ -f "$zip_file" ]; then
        TEMP_DIR=$(mktemp -d)

        unzip -o "$zip_file" -d "$TEMP_DIR"

        DESTINATION_DIR="$SOURCE_DIR/$PHOTOS_DIR_NAME"
        mkdir -p "$DESTINATION_DIR"

        find "$TEMP_DIR" -type f -path "*/photo/original/*" -exec mv {} "$DESTINATION_DIR" \;

        rm -rf "$TEMP_DIR"
    fi
done
