#!/bin/bash

temp="$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | paste -sd "," -)"
temp="{'name': [$temp]}"
echo $temp

paths=$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | sort -u | jq -R -s 'split("\n")[:-1] | map({"name": .})')

echo  paths="[$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | tr '\n' , | sed -e '$s/,$//')]"