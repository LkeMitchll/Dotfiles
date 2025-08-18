# Disable greeting message
set fish_greeting

# Homebrew
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin

# FZF
set -gx FZF_DEFAULT_OPTS "--color=16"
source (brew --prefix fzf)/shell/key-bindings.fish
fzf_key_bindings

# Theme
source ~/.local/share/nvim/site/pack/core/opt/tokyonight.nvim/extras/fish/tokyonight_night.fish
