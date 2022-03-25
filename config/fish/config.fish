set -gx EDITOR nvim
set -e PATH
set -gx PATH /opt/homebrew/bin /usr/local/bin $PATH
set -gx PATH /usr/sbin /sbin /usr/bin /bin $PATH
set -gx PATH ~/.config/nvim/node_modules/.bin ~/.cargo/bin $PATH

bind \cn accept-autosuggestion

# FZF
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'

# ASDF
source (brew --prefix)/opt/asdf/libexec/asdf.fish

source ~/.config/fish/aliases.fish
source ~/.config/fish/theme.fish
