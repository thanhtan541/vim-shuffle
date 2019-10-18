#!/usr/bin/env bash

vim_dir=~/.vim
project_dir=$(pwd)
project_name=${PWD##*/}

if [ -d "$vim_dir" ];
then
    cd ..
    ln -sF "$project_dir" "$vim_dir/bundle"
    if [ -L "$vim_dir/bundle/$project_name" ];
    then
        echo "Success"
    else
        echo "Fail"
    fi
else
    echo "Cannot find $vim_dir"
fi

