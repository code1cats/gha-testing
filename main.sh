#!/bin/bash

temp=""

while read -r path; do
    temp+="'"
    temp+="${path}"
    temp+="',"
done < <(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq)

temp=$(echo $temp | sed -e '$s/,$//' )
temp="{'name': [$temp]}"
echo $temp


echo  "paths=$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | tr '\n' , | sed -e '$s/,$//')"