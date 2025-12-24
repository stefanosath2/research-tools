#!/usr/bin/env bash
set -e # exit if installation fails

# add repositories 
sudo add-apt-repository -y ppa:aos1/diff-so-fancy
sudp apt update
sudo apt install -y extrepo
sudo extrepo enable librewolf

# update after changes in repository
sudo apt update

# install packages 
sudo apt install -y \
	bat tldr diff-so-fancy \
	tmux vim git make nom r-base \
	libmagick++-dev \
	librewolf

# install binary for nom rss reader
curl -L https://github.com/guyfedwards/nom/releases/download/v2.16.2/nom_2.16.2_linux_amd64.tar.gz | sudo tar -C /usr/local/bin -xvzf - nom

# setting up git
git config --global user.name ""
git config --global user.email ""
git config --global core.autocrlf input
git config --global core.editor "vim"
git config --global init.defaultBranch main
git config --global core.quotepath false

# configure git to use diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

# save the git configuration file 
git config --list --global > git_configuration.md

# clone tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf # reload tmux so tpm is sourced
# press prefix + I to install and prefix + U to update/remove plugins
