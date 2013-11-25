#!/bin/bash

# create files
touch not_ver.file ver{0..10}.file

# create symlinks
for file in `find *.file`; do
    ln -s "$file" "${file/%.file/.lnk}"
done

# remove files
rm -f ver*.file
