#!/bin/bash
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# Install dependencies using homebrew
/opt/homebrew/bin/brew bundle --file ~/.dotfiles/config/homebrew/Brewfile
# Change the default shell to fish
sudo sh -c  "echo /opt/homebrew/bin/fish >> /etc/shells"
chsh -s /opt/homebrew/bin/fish
# Launch fish and add homebrew to $PATH
/opt/homebrew/bin/fish -c "fish_add_path /opt/homebrew/bin"
# Symlink all the dotfiles
/opt/homebrew/bin/fish -c "rcup"
# Install lazy.nvim
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
