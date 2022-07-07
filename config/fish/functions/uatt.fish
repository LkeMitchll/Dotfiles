function uatt
  set uatt_seperator "**************************************"

  echo "✨ Update All The Things!"
  echo $uatt_seperator
  brew update
  brew bundle --global
  brew bundle --file ~/.Brewfile.local
  brew upgrade
  echo \n"✨ Homebrew packages up-to-date"
  echo $uatt_seperator
  asdf plugin-update --all
  echo \n"✨ ASDF plugins up-to-date"
  echo $uatt_seperator
  cd ~/.config/nvim ;and npm install ;and cd -
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  echo \n\n"✨ Neovim plugins up-to-date"
  echo $uatt_seperator
  echo \n"✨ All done!"
end
