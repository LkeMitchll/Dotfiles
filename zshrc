export TERM=screen-256color
export XDG_CONFIG_HOME="/Users/Luke/.config"
export RCRC="$XDG_CONFIG_HOME/rcrc"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/texbin:$PATH"
export LS_COLORS="di=1:fi=1:ln=32:or=31:mi=31:ex=35"

# Enable autocomplete
autoload -Uz compinit
compinit

# Color helpers
autoload -U colors
colors

# Case insensitive matching (similar to oh-my-zsh)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Do menu-driven completion.
zstyle ':completion:*' menu select
# Color completion for some things.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Custom prompt
source $XDG_CONFIG_HOME/zsh/prompt.zsh

# Aliases
source $XDG_CONFIG_HOME/zsh/aliases

# Plugins
source ~/.antigen/antigen.zsh

antigen bundles <<EOBUNDLES
  $XDG_CONFIG_HOME/zsh/lib
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
EOBUNDLES

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX="1"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Fuck
eval $(thefuck --alias)
