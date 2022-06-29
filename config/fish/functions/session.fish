function kitty-tab
  kitty @ set-tab-title $argv[1]; clear
end

function session
  cd $argv[1]
  kitty-tab $argv[2]; clear
  kitty @ new-window --cwd=$PWD --title=server_$argv[2] --keep-focus; clear
  kitty @ send_text --match=title:server_$argv[2] $argv[3]\u000D
  nvim +KittyOpenRunner
end
