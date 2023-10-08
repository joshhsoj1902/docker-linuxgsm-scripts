#!/bin/bash

for dir in $(find . -type d); do
    if [ -f "$dir"/Dockerfile ]; then
        echo "============================"
        echo "Running test $dir"
        echo "============================"
        # docker build --no-cache --progress plain -f "$dir"/Dockerfile -t testing $dir
        docker build --progress plain -f "$dir"/Dockerfile -t testing "$dir"
    fi
done
