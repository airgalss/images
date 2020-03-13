#!/bin/bash

src=~/Desktop/Screen*
dst="/tmp/images"

prefix="hadoop"
format="png"
branch="hadoop"
name="$prefix-$1.$format"
if [[ $# -eq 1 && $1 != -p ]];then 
    [ `ls $src | wc -l` -gt 1 ] && echo "more than one image" >&2
    mv $src $dst/$name
    exit 0
elif [[ $# -eq 1 && $1 = -p ]];then 
    git add .
    git commit --amend -m "first commit"
    git push -f origin $branch
elif [ $# -eq 0 ];then
    echo "need a parameter" >&2
elif [ $# -ge 2 ];then
    echo "too many parameters" >&2
fi
