#!/bin/bash

cat repo_names | \
while read name; do
    address=git@github.com:$user/$name.git

    #move all the files into a self-named folder
    # git clone $address
    # mkdir temp_for_rename
    # mv $address/* temp_for_rename
    # mv temp_for_rename $address/$address

    #merge the repo into the mega_repo
    cd  $megarepo
    git remote add $name $address
    git pull $name master
    
done