function kitty-tab
  kitty @ set-tab-title $argv[1]; clear
end

function session
  cd $argv[1]
  kitty-tab $argv[2]; clear
  kitty @ new-window --cwd=$PWD --keep-focus; clear
end
