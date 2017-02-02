# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="interrobang"

# Aliases
source $HOME/.aliases

DISABLE_AUTO_UPDATE="false"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(themes history-substring-search osx zsh-syntax-highlighting)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=\
/usr/local/bin\
:/usr/local/sbin\
:/usr/bin\
:/bin\
:/usr/sbin\
:/sbin\
:~/.bin\

# MISC
eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
eval "$(thefuck --alias)"

source ~/.bin/tmuxinator.zsh
source ~/.zsh/brew_cask_upgrade.zsh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
