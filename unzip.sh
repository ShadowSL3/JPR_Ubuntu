#!/bin/bash

ZIP_FILE=$1
EXTRACT_DIR=$2
FILE_TO_EXTRACT=$3

[ -z "$ZIP_FILE" ] || [ -z "$EXTRACT_DIR" ] || [ -z "$FILE_TO_EXTRACT" ] && echo "Usage: $0 <zip_file> <extract_dir> <file_to_extract>" && exit 1

[! -f "$ZIP_FILE" ] && echo "Error: $ZIP_FILE not found" && exit 1

[! -d "$EXTRACT_DIR" ] && mkdir -p "$EXTRACT_DIR"

unzip -j "$ZIP_FILE" "$FILE_TO_EXTRACT" -d "$EXTRACT_DIR" || echo "Error: unable to extract $FILE_TO_EXTRACT from $ZIP_FILE" && exit 1

echo "File $FILE_TO_EXTRACT extracted successfully to $EXTRACT_DIR"