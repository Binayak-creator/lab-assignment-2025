#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory1> <directory2>"
    exit 1
fi

dirA="$1"
dirB="$2"

if [ ! -d "$dirA" ] || [ ! -d "$dirB" ]; then
    echo "Error: Both arguments must be directories"
    exit 1
fi

echo "=== Comparing directories: $dirA vs $dirB ==="
echo ""

echo "=== Files only in $dirA ==="
for file in "$dirA"/*; do
    filename=$(basename "$file")
    if [ ! -f "$dirB/$filename" ]; then
        echo "$filename"
    fi
done

echo ""
echo "=== Files only in $dirB ==="
for file in "$dirB"/*; do
    filename=$(basename "$file")
    if [ ! -f "$dirA/$filename" ]; then
        echo "$filename"
    fi
done

echo ""
echo "=== Common files (checking content match) ==="
for file in "$dirA"/*; do
    filename=$(basename "$file")
    if [ -f "$dirB/$filename" ]; then
        if cmp -s "$dirA/$filename" "$dirB/$filename"; then
            echo "$filename: CONTENT MATCHES"
        else
            echo "$filename: CONTENT DIFFERENT"
        fi
    fi
done