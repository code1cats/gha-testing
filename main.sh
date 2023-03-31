#!/bin/bash
temp1=$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | tr '\n' , | sed -e '$s/,$//')
temp2="{'name':[$temp1]}"
echo  "paths=$temp2"