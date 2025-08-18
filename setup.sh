#!/bin/zsh
# Install dependencies using homebrew
/opt/homebrew/bin/brew bundle --file ~/.dotfiles/config/homebrew/Brewfile
# Change the default shell to fish
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
# Symlink dotfiles
/opt/homebrew/bin/rcm/bin/rcup -v
