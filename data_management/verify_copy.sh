#!/bin/bash

DATE=$1

SOURCE_DIR="/Volumes/LUMIX/DCIM/100_PANA/$DATE/MOV"

DEST_DIR="/Users/fukudahiromumi/mov/backup/$DATE/MOV"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "指定された日付のディレクトリが存在しません: $SOURCE_DIR"
    exit 1
fi

total_files=$(find "$SOURCE_DIR" -type f -name "*.MOV" | wc -l)
echo "処理対象の総ファイル数: $total_files"

total_files=0
success_count=0
fail_count=0
skip_count=0

mkdir -p "$DEST_DIR"

for file in "$SOURCE_DIR"/*.MOV; do
    if [ -f "$file" ]; then
        ((total_files++))
        basefile=$(basename "$file")

        if [ -f "$DEST_DIR/$basefile" ]; then
            ((skip_count++))
            continue
        fi

        cp "$file" "$DEST_DIR/$basefile"

        original_md5=$(md5 -q "$file")
        copied_md5=$(md5 -q "$DEST_DIR/$basefile")

        if [ "$original_md5" == "$copied_md5" ]; then
            echo "success verify copy: $file"
            ((success_count++))
        else
            echo "コピーに失敗: $file"
            ((fail_count++))
            rm "$DEST_DIR/$basefile"
        fi
    fi
done

echo "総ファイル数: $total_files"
echo "成功数: $success_count"
echo "失敗数: $fail_count"
echo "スキップ数: $skip_count"
