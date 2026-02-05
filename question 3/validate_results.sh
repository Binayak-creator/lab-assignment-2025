#!/bin/bash

file="marks.txt"

if [ ! -f "$file" ]; then
    echo "Error: marks.txt not found"
    exit 1
fi

echo "=== Students who failed in exactly ONE subject ==="
fail_one_count=0

echo "=== Students who passed in ALL subjects ==="
pass_all_count=0

while IFS=',' read -r roll name m1 m2 m3; do
    # Count failed subjects
    fail_count=0
    [ $m1 -lt 33 ] && ((fail_count++))
    [ $m2 -lt 33 ] && ((fail_count++))
    [ $m3 -lt 33 ] && ((fail_count++))
    
    if [ $fail_count -eq 1 ]; then
        echo "$roll $name (Marks: $m1, $m2, $m3)"
        ((fail_one_count++))
    fi
    
    if [ $fail_count -eq 0 ]; then
        echo "$roll $name (Marks: $m1, $m2, $m3)"
        ((pass_all_count++))
    fi
done < "$file"

echo ""
echo "=== Summary ==="
echo "Students failed in exactly one subject: $fail_one_count"
echo "Students passed in all subjects: $pass_all_count"