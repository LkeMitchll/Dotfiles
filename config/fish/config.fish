set -e PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/local/bin /usr/sbin /sbin /usr/bin /bin $PATH
set fish_greeting

# FZF
set -gx FZF_CTRL_T_COMMAND "rg --hidden --files"
source (brew --prefix)/opt/fzf/shell/key-bindings.fish; and fzf_key_bindings

# ASDF
source (brew --prefix)/opt/asdf/libexec/asdf.fish

source ~/.config/fish/aliases.fish
source ~/.config/nvim/pack/vish/start/tokyonight.nvim/extras/fish/tokyonight_night.fish
