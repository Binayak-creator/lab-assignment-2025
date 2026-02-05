#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Need 1 argument"
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "Error: Path not found"
    exit 1
fi

if [ -f "$1" ]; then
    lines=$(wc -l < "$1")
    words=$(wc -w < "$1")
    chars=$(wc -m < "$1")
    echo "File: $1"
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Chars: $chars"
elif [ -d "$1" ]; then
    total=$(find "$1" -type f | wc -l)
    txt=$(find "$1" -name "*.txt" -type f | wc -l)
    echo "Directory: $1"
    echo "Total files: $total"
    echo "Text files: $txt"
fi