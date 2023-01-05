function session
  # Usage: session <directory> <command>
  # e.g.   session ~/Developer/interroban.gg "npm run dev"
  cd $argv[1]
  set tab_name (string split "/" $PWD)[-1]

  kitty @ set-tab-title $tab_name
  kitty @ launch --cwd=$PWD --title=server_$tab_name --keep-focus
  kitty @ send_text --match=title:server_$tab_name $argv[2]\u000D
  nvim +KittyOpenRunner README.md
end
