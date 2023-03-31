#!/bin/bash

echo  "paths=$(git diff --name-only -r HEAD^1 HEAD | grep env | cut -d/ -f1 | uniq | tr '\n' , | sed -e '$s/,$//')"