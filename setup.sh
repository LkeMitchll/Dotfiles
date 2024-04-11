#!/bin/bash
fish_path="/opt/homebrew/bin/fish"
brew_path="/opt/homebrew/bin/brew"
# Install dependencies using homebrew
$brew_path bundle --file ~/.dotfiles/config/homebrew/Brewfile
# Change the default shell to fish
sudo sh -c  "echo ${fish_path} >> /etc/shells"
chsh -s $fish_path
# Launch fish and add homebrew to $PATH
$fish_path -c "fish_add_path /opt/homebrew/bin"
# Symlink all the dotfiles
$fish_path -c "rcup -v"
# Install nvim plugin manager
$fish_path -c "git clone git@github.com:echasnovski/mini.nvim.git ~/.local/share/nvim/site/pack/deps/start/mini.nvim"
