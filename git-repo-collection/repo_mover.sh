#!/bin/bash

user=$1
megarepo=$2

if [ !$user ];
	echo "no user name provided" 
	then exit;
fi;

if [ !$megarepo ];
	echo "no collection repository name provided" 
	then exit;
fi;

./get_git.sh $user

cd ~/Desktop

git clone git@github.com:loschorts/$megarepo.git

cd ~/Desktop/$megarepo
git add -A

cat ~/Desktop/repo_names | \
while read name; do
    address=git@github.com:$user/$name.git
    echo $address

    #move all the files into a self-named folder
    cd ~/Desktop
    git clone $address
    cd ~/Desktop/$address
    mkdir ../temp_for_rename
    mv ./* ../temp_for_rename
    mv ../temp_for_rename ./$address

    #merge the repo into the mega_repo
    cd ~/Desktop/$megarepo
    git remote add $name $address
    git pull $name master
done

cd ~/Desktop/$megarepo