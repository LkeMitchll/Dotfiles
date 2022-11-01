set -gx PATH /opt/homebrew/bin $PATH
set fish_greeting

# FZF
set -gx FZF_DEFAULT_OPS "--color=16"
source (brew --prefix)/opt/fzf/shell/key-bindings.fish; and fzf_key_bindings

# ASDF
source (brew --prefix)/opt/asdf/libexec/asdf.fish

# Aliases
abbr c clear
abbr g git
abbr vim nvim
abbr vr "nvim +KittyOpenRunner"

source ~/.config/nvim/pack/vish/start/tokyonight.nvim/extras/fish/tokyonight_night.fish
