kitty-tab() {
  kitty @ set-tab-title $1; clear
}

session() {
  cd $1
  kitty-tab $2; clear
  kitty @ new-window --cwd=$PWD --keep-focus; clear
}
