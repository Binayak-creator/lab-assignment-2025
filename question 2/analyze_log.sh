#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Need log file"
    exit
fi

if [ ! -f "$1" ]; then
    echo "File missing"
    exit
fi

report="logsummary_$(date +%Y-%m-%d).txt"

total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warn=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")
recent_error=$(grep " ERROR " "$1" | tail -1)

echo "Report $(date)" > $report
echo "File: $1" >> $report
echo "Total: $total" >> $report
echo "INFO: $info" >> $report
echo "WARNING: $warn" >> $report
echo "ERROR: $error" >> $report
echo "Last ERROR: $recent_error" >> $report

cat $report