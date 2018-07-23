export EDITOR=nvim
export TERM=screen-256color
export XDG_CONFIG_HOME="/Users/Luke/.config"
export RCRC="$XDG_CONFIG_HOME/rcrc"
export LS_COLORS="di=1:fi=1:ln=32:or=31:mi=31:ex=35"
export KEYTIMEOUT=1

export PATH="/usr/local/bin:$HOME/.bin:/usr/sbin:/sbin:/usr/bin:/bin:$PATH"

# Vi mode
bindkey -v

# Completion config
source $XDG_CONFIG_HOME/zsh/completion.zsh

# Custom prompt
source $XDG_CONFIG_HOME/zsh/prompt.zsh

# Aliases
source $XDG_CONFIG_HOME/zsh/aliases

# Plugins
source <(antibody init)
antibody bundle < $XDG_CONFIG_HOME/zsh/antibody

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^N' autosuggest-accept
ZSH_AUTOSUGGEST_USE_ASYNC=true
FZF_MARKS_FILE=${XDG_CONFIG_HOME}/fzf-marks/fzf-marks

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
