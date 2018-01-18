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
zstyle ':completion:*' group-name ''
