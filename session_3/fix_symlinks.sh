#!/bin/bash

# fix broken symlinks in folder.
# default: current working directory
folder=${1-`pwd`}

# try to change folder
if ! `cd "$folder"`; then
    exit 1
fi

# remove broken symlinks and warn about symlinks to empty files
for file in `find *`; do
    if [[ -L "$file" ]]; then
        if [[ ! -e "$file" ]]; then
            rm -f "$file"
        elif [[ ! -s "$file" ]]; then
            echo "Symlink to empty file: $file"
        fi
    fi        
done
