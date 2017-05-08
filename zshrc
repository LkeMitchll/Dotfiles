export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export LS_COLORS='di=1:fi=1:ln=32:or=31:mi=31:ex=35'

# Enable autocomplete
autoload -Uz compinit
compinit

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

# Color helpers
autoload -U colors
colors

# Custom prompt
source ~/.zsh/prompt.zsh

# Rbenv
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Pyenv
eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX="1"
export FZF_DEFAULT_COMMAND="ag -g ''"
export FZF_CTRL_T_COMMAND="ag -g ''"

# Aliases
source ~/.aliases

# Plugins
source ~/.zsh/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
