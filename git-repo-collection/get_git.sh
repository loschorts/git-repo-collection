#!/usr/bin/env ruby

require 'httpclient'
require 'json'
require 'byebug'

File.write("repo_names", nil)


def get_repo_names username

	req = HTTPClient.new

	result = []

	page = 0

	loop do
		page += 1
		p "fetching page #{page}"
		res = req.get "https://api.github.com/users/#{username}/repos?page=#{page}&per_page=100"
		repos = JSON.parse(res.body)
		raise 'No results found, check username' if repos.class == Hash && repos["message"] == "Not Found"
		break if repos.empty?
		result += repos.map { |repo| repo_name(repo["git_url"]) }.select { |name| !!(/w.d./ =~ name) || !!(/W.D./ =~ name) }
	end

	result
end

def repo_name git_url
	git_url.split("/").last.split(".").first
end

File.write("repo_names", get_repo_names(ARGV[0]).join("\n"))



