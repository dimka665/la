#!/bin/bash

html_folder="html/files"
html_filename="index.html"
html_path="$html_folder/$html_filename"

html_content=`cat text.txt`

html_page="<html>
    <head>
        <title>Dummy page</title>
    </head>
    <body>
        ${html_content}
    </body>
</html>"

mkdir -p "$html_folder"

echo "$html_page" > "$html_path"

ln "$html_path" "$html_folder/../$html_filename"
ln -s "$html_path" "index.lnk"

chmod ug=rw,o=x "$html_path"
