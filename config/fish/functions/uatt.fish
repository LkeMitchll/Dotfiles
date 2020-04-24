function uatt
  set uatt_seperator "====================="

  brew bundle --global
  brew bundle --global cleanup --force
  brew update
  brew upgrade
  brew cask upgrade
  echo "Packages up-to-date"
  echo $uatt_seperator
  RCRC=~/.dotfiles/config/rcrc rcup
  echo "Dotfiles up-to-date"
  echo $uatt_seperator
  asdf update
  asdf plugin-update --all
  echo $uatt_seperator
  nvim-update
  echo "Neovim plugins up-to-date"
  echo $uatt_seperator
  waiter 5
end
