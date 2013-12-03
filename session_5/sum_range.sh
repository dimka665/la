#!/bin/bash

int_regex='^-?[0-9]+$'

if ! [[ "$1" =~ $int_regex && "$2" =~ $int_regex ]]; then
    echo "Error: script '$0' needs two integer args"
    exit 1
fi

while read line; do
    if [ ! "$line" ]; then
        break
    fi
    for num in $line; do
        if [ "$num" -ge "$1" -a "$num" -le "$2" ]; then
            let sum+=num
        fi
    done
done

echo ${sum-0}
