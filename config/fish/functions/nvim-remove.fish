function nvim-remove
  cd ~/.dotfiles
  echo "nvim: Cleaning up old files..."

  if test -n $argv[1]
    echo "nvim: Uninstalling" $argv[1]
    git submodule deinit -f config/nvim/pack/interrobang/start/$argv[1]
    git rm -f config/nvim/pack/interrobang/start/$argv[1]
    rm -Rf .git/modules/config/nvim/pack/interrobang/start/$argv[1]
  end

  cd -
end
