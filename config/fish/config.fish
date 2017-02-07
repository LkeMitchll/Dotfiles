set -x PATH /usr/local/bin $PATH
set -x PATH /usr/bin $PATH
set -x PATH bin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /sbin $PATH
set -x PATH ~/.bin $PATH

set -x PATH $HOME/.rbenv/shims $PATH
status --is-interactive; and source (rbenv init -|psub)

source $HOME/.aliases
