export TERM=screen-256color
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export LS_COLORS='di=1:fi=1:ln=32:or=31:mi=31:ex=35'

# Enable autocomplete
autoload -Uz compinit
compinit

# Color helpers
autoload -U colors
colors

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
source ~/.zsh/prompt.zsh

# Aliases
source ~/.aliases

# Plugins
source ~/.antigen/antigen.zsh

antigen bundles <<EOBUNDLES
  nvm
  rbenv
  pyenv
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
EOBUNDLES

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX="1"
export FZF_DEFAULT_COMMAND="ag -g ''"
export FZF_CTRL_T_COMMAND="ag -g ''"
