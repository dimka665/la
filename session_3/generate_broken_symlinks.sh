#!/bin/bash

# folder for creating symlinks.
# default: current working directory
folder=${1-`pwd`}

# try to create folder
if ! `mkdir -p "$folder"`; then
    exit 1
fi

cd "$folder"

# create files
touch not_ver.file ver{0..10}.file

# create symlinks
for file in `find *.file`; do
    ln -s "$file" "${file/%.file/.lnk}"
done

# remove files except 'not_ver.file'
rm -f ver*.file
