# Customize Prompt
autoload -Uz promptinit
promptinit
prompt powerline

# include zaw
if [ -d ~/zaw ]; then
	source ~/zaw/zaw.zsh
	bindkey  '^R' zaw-history
	bindkey  '^o' zaw-open-file
fi

# include Vim and Check OS
# I don't think Windows(etc.. Cygwin MinGW MSYS2)
if [ "$(uname)" == 'Darwin' ]; then
	alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
	alias gvim='/Applications/MacVim.app/Contents/MacOS/MacVim'
	alias vi='vim'
	OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS='Linux'
fi

# include rbenv
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$PATH
	eval "$(rbenv init - zsh)"
fi

# include tmuxinator
if [ -d ~/.tmuxinator ]; then
	source ~/.tmuxinator/tmuxinator.zsh
fi
