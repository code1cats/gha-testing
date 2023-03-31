#!/bin/bash

temp1=""

while read -r path; do
    temp1+="'"
    temp1+="${path}"
    temp1+="',"
done < <(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq)

temp2=$(echo $temp1 | sed -e '$s/,$//' )

echo $temp2


echo  "paths=$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | tr '\n' , | sed -e '$s/,$//')"