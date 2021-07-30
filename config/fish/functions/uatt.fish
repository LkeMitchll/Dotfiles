function uatt
  set uatt_seperator "====================="

  /* Update homebrew itself */
  brew update
  /* Install ~/.Brewfile dependencies */
  brew bundle --global
  /* Install ~/.Brewfile.local dependencies */
  brew bundle --file ~/.Brewfile.local
  /* Upgrade homebrew dependencies */
  brew upgrade
  echo "Packages up-to-date"
  echo $uatt_seperator
  /* Update fisher plugins */
  fisher update
  echo "Fish plugins up-to-date"
  echo $uatt_seperator
  /* Update asdf plugins */
  asdf plugin-update --all
  echo "ASDF plugins up-to-date"
  echo $uatt_seperator
  /* Install LSP's */
  cd ~/.config/nvim ;and npm install ;and cd -
  /* Update Neovim plugins */
  nvim +PackerSync
  echo "Neovim plugins up-to-date"
  echo $uatt_seperator
end
