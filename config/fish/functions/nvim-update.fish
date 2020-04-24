function nvim-update
  cd ~/.dotfiles
  echo "nvim: Cleaning up old files..."
  rcdn
  echo "nvim: Updating plugins"
  git submodule update --remote --merge
  echo "nvim: Symlinking..."
  rcup
  cd -
end
