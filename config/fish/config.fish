set fish_greeting # Disable greeting message

# Homebrew
fish_add_path /opt/homebrew/bin
# FZF
set -gx FZF_DEFAULT_OPTS "--color=16"
source (brew --prefix fzf)/shell/key-bindings.fish; and fzf_key_bindings
# ASDF
source (brew --prefix asdf)/libexec/asdf.fish

# Aliases
abbr g git
abbr vim nvim
abbr vr "nvim +KittyOpenRunner"

# Create kitty 'session' in folders with .kitty-session on cd
source ~/.config/fish/functions/session.fish

# Theme
source ~/.local/share/nvim/lazy/tokyonight.nvim/extras/fish/tokyonight_night.fish
