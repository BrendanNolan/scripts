#!/bin/bash
# Credit The Primeagen

languages=`echo "lua cpp c rust python" | tr ' ' '\n'`
core_utils=`echo "grep rg find fd sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if echo "$languages" | grep -qa "$selected"; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
