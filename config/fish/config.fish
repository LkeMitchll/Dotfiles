set fish_greeting

# Homebrew
set -gx PATH /opt/homebrew/bin $PATH

# FZF
set -gx FZF_DEFAULT_OPTS "--color=16"
source (brew --prefix)/opt/fzf/shell/key-bindings.fish; and fzf_key_bindings

# ASDF
source (brew --prefix)/opt/asdf/libexec/asdf.fish

# Aliases
abbr g git
abbr vim nvim
abbr vr "nvim +KittyOpenRunner"

# Theme
source ~/.local/share/nvim/lazy/tokyonight.nvim/extras/fish/tokyonight_night.fish
