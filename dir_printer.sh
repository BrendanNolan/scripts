#! /usr/bin/env bash

dirs=$(find . -maxdepth 1 -type d -not -path '*/\.*' -not -path '.')

for dir in $dirs; do
    cd $dir
    echo "dir:"
    echo $dir
    dir_name_no_path=$(basename "$dir")
    echo "dir without path:"
    echo $dir_name_no_path
    cd ..
done

