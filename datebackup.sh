#!/bin/bash
src="$1"
ts=$(date +%Y%m%d_%H%M%S)
cp -r "$src" "${src}_backup_$ts"
