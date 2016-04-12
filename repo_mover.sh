#!/bin/env ruby

user=ARGV[0]
megarepo=ARGV[1]

raise 'must provide username and megarepo name' unless user && megarepo

system "./fetch_repo_names #{user}"

Dir.chdir "staging"

system "git clone git@github.com:#{user}/#{megarepo}.git"

File.readlines("repo_names").each do |repo|
    address = "git@github.com:#{user}/#{repo}.git"
    #move all the files into a self-named folder
    system "git clone #{address}"

    system "rmdir temp"
    system "mkdir temp"
    system "mv #{repo}/* temp"
    system "mv temp #{repo}/#{repo}"

    #merge the repo into the mega_repo
    system "cd  #{megarepo}"
    system "git remote add #{repo} #{address}"
    system "git pull #{repo} master"
end

Dir.chdir ("..")

