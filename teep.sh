#!/bin/bash

count=`curl -s "$1" | grep -c "$2"`


declare -A occurrenceword=(
  [-1]=occurrence
  [1]=occurrence
)

if [ "$count" == "0" ]
then
    echo "Site has been changed"
    exit 1
else
    echo "The site is still the same with ${count} '$2' ${occurrenceword[${count:-0}]:-occurrences}"
    exit 0
fi
