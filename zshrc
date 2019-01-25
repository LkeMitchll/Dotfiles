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
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# Plugins
source <(antibody init)
antibody bundle < $XDG_CONFIG_HOME/zsh/plugins.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^N' autosuggest-accept
ZSH_AUTOSUGGEST_USE_ASYNC=true
FZF_MARKS_FILE=${XDG_CONFIG_HOME}/fzf-marks/fzf-marks
FZF_MARKS_KEEP_ORDER=1

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
