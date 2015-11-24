#!/bin/sh

tmuxinatorPath=$(find ~/ -name "tmuxinator.zsh" 2> /dev/null)
ln -s $tmuxinatorPath ./
