#!/bin/bash

ssd_paths=("/Volumes/SSD256s/DCIM/100_PANA" "/Volumes/LUMIX/DCIM/100_PANA")

extensions=("RW2" "MOV")

process_files() {
    local ssd_path=$1
    for ext in "${extensions[@]}"; do
        for file in "$ssd_path"/*.$ext; do
            [ -e "$file" ] || continue

            creation_date=$(stat -f "%Sm" -t "%Y%m%d" "$file")

            mkdir -p "$ssd_path/$creation_date/$ext"

            base_name=$(basename "$file")
            new_name="${creation_date}_${base_name}"

            mv "$file" "$ssd_path/$creation_date/$ext/$new_name"
        done
    done
}

for ssd_path in "${ssd_paths[@]}"; do
    if [ -d "$ssd_path" ]; then
        process_files "$ssd_path"
    fi
done
