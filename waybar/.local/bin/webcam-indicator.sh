#!/usr/bin/env sh

 fuser /dev/video* 2>/dev/null|xargs -r ps --no-headers -eo pid,comm -q \
| sed 's/\.\(.*\)-wra\?p\?p\?e\?d\?/\1/g' \
| awk '{print "{\"tooltip\": \"" $NF " " "["$1"]" "\"}"}' \
| jq -s 'if length > 0 then {text: "󰖠", tooltip: (map(.tooltip) | join("\r"))} else {text: ""} end' \
| jq --unbuffered --compact-output
