function title
  echo (set_color $argv[2])\n$argv[1](set_color normal)
end

function uatt
  set divider (set_color blue)(string repeat -n 50 '*')(set_color normal)
  set brewfiles ~/.config/homebrew/Brewfile ~/.config/homebrew/Brewfile.local

  title "UATT: Update All The Things!" magenta
  echo $divider

  title "Updating Homebrew packages..." yellow
  cat $brewfiles | brew bundle --file=-
  brew upgrade
  title "Homebrew packages up-to-date" green
  echo $divider

  title "Updating ASDF plugins..." yellow
  asdf plugin-update --all
  title "ASDF plugins up-to-date" green
  echo $divider

  title "Updating Neovim plugins..." yellow
  nvim --headless "+Lazy! sync" +qa
  title "Neovim plugins up-to-date" green
  echo $divider

  title "All done!" red
end
