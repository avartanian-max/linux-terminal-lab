#!/bin/bash
ts=$(date +%Y%m%d_%H%M%S)
outfile="monitor_$ts.log"

for host in google.com github.com stackoverflow.com; do
    if ping -c 1 "$host" > /dev/null 2>&1; then
        echo "$host UP" >> "$outfile"
    else
        echo "$host DOWN" >> "$outfile"
    fi
done
