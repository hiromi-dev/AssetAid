#!/bin/bash

# 目標とするメガピクセル（この場合は8メガピクセル）
target_megapixels=8
target_pixels=$((target_megapixels * 1000000))

image_folder="$1"
output_folder="$2"

extensions=("jpg" "JPG")

for ext in "${extensions[@]}"; do
    for input_file in "$image_folder"*.$ext; do
        width=$(identify -format "%w" "$input_file")
        height=$(identify -format "%h" "$input_file")

        ratio=$(echo "scale=4; sqrt($target_pixels / ($width * $height))" | bc)

        new_width=$(echo "$width * $ratio" | bc)
        new_height=$(echo "$height * $ratio" | bc)

        output_file="$output_folder/$(basename "$input_file" .$ext)_resized.$ext"

        convert "$input_file" -resize "${new_width}x${new_height}" "$output_file"
    done
done
