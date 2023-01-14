#!/bin/bash

IFS=$'\n'

cmds="
co checkout
br branch
ci commit
last 'log -1 HEAD'
r reset
rh 'reset --hard'
ac '!git add -A && git commit -m'
s status
d diff
"

for entry in $cmds;
do
    eval "git config --global alias.$entry"
done


IFS=' '
