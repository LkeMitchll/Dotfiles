export EDITOR=nvim
export XDG_CONFIG_HOME="/Users/Luke/.config"
export RCRC="$XDG_CONFIG_HOME/rcrc"
export KEYTIMEOUT=1
export HOMEBREW_BUNDLE_NO_LOCK=1
export PATH="/usr/local/bin:/usr/sbin:/sbin:/usr/bin:/bin:$PATH"

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
## history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
## autosuggestions
bindkey '^N' autosuggest-accept
ZSH_AUTOSUGGEST_USE_ASYNC=true

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
