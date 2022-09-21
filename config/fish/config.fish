set brew_path (brew --prefix)

set -e PATH
set -gx PATH $brew_path/bin $PATH
set -gx PATH /usr/local/bin /usr/sbin /sbin /usr/bin /bin $PATH
set -gx PATH ~/.config/nvim/node_modules/.bin ~/.cargo/bin $PATH

# FZF
set -gx FZF_CTRL_T_COMMAND "rg --hidden --files"
source $brew_path/opt/fzf/shell/key-bindings.fish; and fzf_key_bindings

# ASDF
source $brew_path/opt/asdf/libexec/asdf.fish

source ~/.config/fish/aliases.fish
source ~/.config/fish/theme.fish
