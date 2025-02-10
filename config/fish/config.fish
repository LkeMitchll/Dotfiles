# Disable greeting message
set fish_greeting

set -gx XDG_CONFIG_HOME ~/.config

# Homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/nvim-macos-arm64/bin
# FZF
set -gx FZF_DEFAULT_OPTS "--color=16"
source (brew --prefix fzf)/shell/key-bindings.fish

# Theme
source ~/.local/share/nvim/site/pack/deps/opt/tokyonight.nvim/extras/fish/tokyonight_night.fish
