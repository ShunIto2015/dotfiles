#!/bin/sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dotfiles/.tmux.conf ~/
echo "Please <C-a> I push!!"
