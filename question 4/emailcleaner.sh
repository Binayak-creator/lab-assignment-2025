#!/bin/bash

input="emails.txt"
valid="valid.txt"
invalid="invalid.txt"

# Check if input file exists
if [ ! -f "$input" ]; then
    echo "Error: $input not found"
    exit 1
fi

# Clear output files if they exist
> "$valid"
> "$invalid"

echo "Processing emails from $input..."

# Extract valid emails (letters/digits @ letters .com)
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' "$input" | sort -u > "$valid"

# Extract invalid emails (everything else)
grep -v -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' "$input" > "$invalid"

# Alternative way using while loop
# while IFS= read -r email; do
#     if [[ "$email" =~ ^[a-zA-Z0-9]+@[a-zA-Z]+\.com$ ]]; then
#         echo "$email" >> "$valid"
#     else
#         echo "$email" >> "$invalid"
#     fi
# done < "$input"

# Remove duplicates from valid (already done with sort -u)
# sort "$valid" | uniq > temp && mv temp "$valid"

echo "Valid emails saved to: $valid"
echo "Invalid emails saved to: $invalid"
echo ""
echo "Valid email count: $(wc -l < "$valid")"
echo "Invalid email count: $(wc -l < "$invalid")"