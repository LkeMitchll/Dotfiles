function uatt
  set uatt_seperator "====================="

  brew update
  brew bundle --global
  brew bundle --file ~/.Brewfile.local
  brew upgrade
  echo "Packages up-to-date"
  echo $uatt_seperator
  fisher update
  echo "Fish plugins up-to-date"
  echo $uatt_seperator
  asdf plugin-update --all
  echo "ASDF plugins up-to-date"
  echo $uatt_seperator
  cd ~/.config/nvim ;and npm install ;and cd -
  nvim +PackerSync
  echo "Neovim plugins up-to-date"
  echo $uatt_seperator
end
