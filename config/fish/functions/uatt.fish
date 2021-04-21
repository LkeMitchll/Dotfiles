function uatt
  set uatt_seperator "====================="

  brew bundle --global
  brew bundle --file ~/.Brewfile.local
  brew update
  brew upgrade
  brew upgrade --cask
  echo "Packages up-to-date"
  echo $uatt_seperator
  RCRC=~/.dotfiles/config/rcrc rcup
  echo "Dotfiles up-to-date"
  echo $uatt_seperator
  fisher
  echo "Fish plugins up-to-date"
  echo $uatt_seperator
  asdf update
  asdf plugin-update --all
  echo "ASDF plugins up-to-date"
  echo $uatt_seperator
  nvim +PackerSync
  echo "Neovim plugins up-to-date"
  echo $uatt_seperator
end
