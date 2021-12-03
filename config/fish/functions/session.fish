/* Usage:                                                       */
/*      session [1: directory] [2: title] [3: server/dev cmd]   */
/*      session ~/Project "Cool Project" "yarn run start"       */

function kitty-tab
  kitty @ set-tab-title $argv[1]; clear
end

function session
  /* Navigate to directory */
  cd $argv[1]
  /* Rename new tab */
  kitty-tab $argv[2]; clear
  /* Create new server window  */
  kitty @ new-window --cwd=$PWD --title=server_$argv[2] --keep-focus; clear
  /* Start server command */
  kitty @ send_text --match=title:server_$argv[2] $argv[3]\u000D
  /* Start neovim plus test runner */
  nvim +KittySpawnRunner
end
