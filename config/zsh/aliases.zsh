alias sl="ls"
alias gs='g s'
alias rpsec="rspec"
alias c='clear'
alias vim='nvim'
alias vi='nvim'
alias z='source ~/.zshrc'
alias finder='open .'
alias vim-update="nvim '+PlugClean' '+PlugUpdate' '+PlugUpgrade' '+qa!'"
# Web dev
alias yr="yarn run"
alias be="bundle exec"
# Git
alias git="hub"
alias g="git"

# Kitty
tab() {
  kitty @ set-tab-title $1; clear
}

session() {
  cd $1
  tab $2; clear
  kitty @ new-window --cwd=$PWD --keep-focus; clear
}

# Update all the things
uatt() {
  local SEPERATOR="====================="
  brew update
  brew upgrade
  brew cask upgrade
  echo $SEPERATOR
  rcup
  echo $SEPERATOR
  antibody update
  echo $SEPERATOR
  asdf update
  asdf plugin-update --all
  echo $SEPERATOR
  mas outdated
  mas upgrade
  echo $SEPERATOR
  vim-update
  echo "Vim plugins up to date."
  echo $SEPERATOR
  waiter 5
}

# Cleanup
housekeep() {
  brew cleanup
  brew cask cleanup
}

# Wait for x seconds then clear
waiter() {
  echo "Waiting for $1 seconds"
  sleep $1
  clear
}
