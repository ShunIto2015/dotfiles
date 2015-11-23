#!/bin/sh
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential libsqlite3-dev libreadline6-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev zsh git vim tmux ssh openssh-server openssh-client libevent-dev
cd ~ && git clone https://github.com/yyuu/pyenv.git ./.pyenv
mkdir -p ./.pyenv/versions ./.pyenv/shims
cd .pyenv/plugins/ && git clone https://github.com/yyuu/pyenv-virtualenv.git

# gnomeTerminal set font to Ricty for Powerline 14
gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/font "Ricty for Powerline 14"
