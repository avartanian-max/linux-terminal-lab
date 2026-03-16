#!/bin/bash
total=0
shopt -s nullglob
for file in *.txt; do
    lines=$(wc -l < "$file")
    total=$((total + lines))
done
echo "Total lines: $total"
