function nvim-update
  cd ~/.dotfiles
  echo "nvim: Updating plugins"
  git submodule update --remote --merge
  if test -L ./config/nvim/pack
    echo "nvim: Already symlinked, skipping..."
  else
    echo "nvim: Symlinking..."
    ln -s ~/.dotfiles/config/nvim/pack ~/.config/nvim/
  end
  cd -
end
