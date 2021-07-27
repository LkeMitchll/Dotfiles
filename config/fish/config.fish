set -e PATH
set -gx PATH /opt/homebrew/bin /usr/local/bin /usr/sbin /sbin /usr/bin /bin ~/.config/nvim/node_modules/.bin $PATH

set -gx EDITOR nvim
set -gx HOMEBREW_BUNDLE_NO_LOCK 1
set -gx KEYTIMEOUT 1
set -gx RCRC "$XDG_CONFIG_HOME/rcrc"
set -gx XDG_CONFIG_HOME "/Users/luke/.config"
bind \cn accept-autosuggestion

source ~/.config/fish/aliases.fish
source ~/.config/fish/theme.fish

# ASDF
source /opt/homebrew/opt/asdf/asdf.fish

# FZF
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'

# Local overrides
source ~/.config/fish/config.local.fish
