#!/bin/bash
# Test cases
echo "Creating test marks.txt..."
cat > test_marks.txt << EOF
201,Test1,40,40,30  # fails 1 subject
202,Test2,50,60,70  # passes all
203,Test3,20,20,20  # fails all
204,Test4,40,25,40  # fails 1 subject
EOF

echo "Running validation script..."
./validate_results.sh