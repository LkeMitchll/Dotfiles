# Update all the things
alias vim-update="nvim '+call minpac#clean()' '+call minpac#update()' '+sleep 5' '+qa'"

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
