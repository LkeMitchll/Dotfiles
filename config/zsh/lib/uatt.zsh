# Update all the things
uatt() {
  local SEPERATOR="====================="
  brew bundle --global
  brew bundle --global cleanup --force
  brew update
  brew upgrade
  brew cask upgrade
  echo $SEPERATOR
  rcup
  echo "Dotfiles up-to-date"
  echo $SEPERATOR
  antibody update
  echo $SEPERATOR
  asdf update
  asdf plugin-update --all
  echo $SEPERATOR
  mas outdated
  mas upgrade
  echo $SEPERATOR
  vim-update
  echo "Neovim plugins up-to-date"
  echo $SEPERATOR
  waiter 5
}

# Cleanup
housekeep() {
  brew cleanup --verbose -s
}
