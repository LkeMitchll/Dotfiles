function nvim-update
  cd ~/.dotfiles
  echo "nvim: Cleaning up old files..."
  echo "nvim: Updating plugins"
  git submodule update --remote --merge
  echo "nvim: Symlinking..."
  ln -s ~/.dotfiles/config/nvim/pack ~/.config/nvim/
  cd -
end
