set -gx EDITOR nvim
set -e  PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/sbin /sbin /usr/bin /bin $PATH
set -gx PATH ~/.config/nvim/node_modules/.bin ~/.cargo/bin $PATH

# Keybinds
bind \cn accept-autosuggestion

# FZF
set -gx FZF_CTRL_T_COMMAND "rg --hidden --files"
source (brew --prefix)/opt/fzf/shell/key-bindings.fish; and fzf_key_bindings

# ASDF
source (brew --prefix)/opt/asdf/libexec/asdf.fish

source ~/.config/fish/aliases.fish
source ~/.config/fish/theme.fish
