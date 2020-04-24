function vim-update
  nvim '+call minpac#clean()' '+call minpac#update()' '+sleep 5' '+qa'
end

function uatt
  set uatt_seperator "====================="

  brew bundle --global
  brew bundle --global cleanup --force
  brew update
  brew upgrade
  brew cask upgrade
  echo $uatt_seperator
  rcup
  echo "Dotfiles up-to-date"
  echo $uatt_seperator
  asdf update
  asdf plugin-update --all
  echo $uatt_seperator
  mas outdated
  mas upgrade
  echo $uatt_seperator
  vim-update
  echo "Neovim plugins up-to-date"
  echo $uatt_seperator
  waiter 5
end
