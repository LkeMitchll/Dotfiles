function nvim-add
  cd ~/.dotfiles

  echo "nvim: Installing" $argv[1]

  if test -n $argv[1]
    set name (string split / $argv[1])
    git submodule add https://github.com/$argv[1] config/nvim/pack/interrobang/start/$name[2]
  end

  rcup
  cd -
end
