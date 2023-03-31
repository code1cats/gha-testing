#!/bin/bash

while read -r path; do
    echo "The path is $path"
done < <(git diff --name-only -r HEAD^1 HEAD | grep env)
