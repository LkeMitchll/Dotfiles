function nvim-add
  cd ~/.dotfiles

  if test -n $argv[1]
    set name (string split / $argv[1])
    git submodule add https://github.com/$argv[1] config/nvim/pack/interrobang/start/$name[2]
  end

  rcup
end
