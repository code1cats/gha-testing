#!/bin/bash

var=()

while read -r path; do
    var+="${path}"
done < <(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq)

echo $var