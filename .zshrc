#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Customize Prompt
autoload -Uz promptinit
promptinit
prompt powerline

# include zaw
source /Users/shunito/zaw/zaw.zsh
bindkey  '^R' zaw-history
bindkey  '^o' zaw-open-file

# include MacVim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/MacVim'
alias vi='vim'

# include rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# include tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
