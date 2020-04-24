function nvim-remove
  cd ~/.dotfiles
  echo "nvim: Cleaning up old files..."
  rcdn

  if test -n $argv[1]
    echo "nvim: Uninstalling" $argv[1]
    git submodule deinit config/nvim/pack/interrobang/$argv[1]
    git rm config/nvim/pack/interrobang/$argv[1]
    rm -Rf .git/modules/config/nvim/pack/interrobang/$argv[1]
  end

  echo "nvim: Symlinking..."
  rcup
  cd -
end
