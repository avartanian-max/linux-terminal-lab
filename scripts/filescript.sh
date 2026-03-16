#!/bin/bash

filename="$1"

if [ -z "$filename" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

if [ -f "$filename" ]; then
    lines=$(wc -l < "$filename")
    echo "$filename exists and has $lines lines."
else
    touch "$filename"
    echo "$filename created"
fi
