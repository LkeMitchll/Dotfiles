# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Aliases
source $HOME/.aliases

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(themes sublime history-substring-search zsh-syntax-highlighting bundler brew rvm osx)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=\
/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin\
:~/.rvm/bin\
:~/.rvm/gems\
:~/.rvm/scripts\
:/usr/local/heroku/bin\
:/usr/local/bin\
:/usr/local/sbin\
:/usr/bin\
:/bin\
:/usr/sbin\
:/sbin\
:/opt/X11/bin\
:/opt/local/bin\
:/usr/local/opt/ruby/bin\
:~/pebble-dev/PebbleSDK-current/bin\
:/usr/local/share/npm/bin\
:/Applications/Postgres.app/Contents/Versions/9.3/bin\
:/usr/local/deployd/bin\
:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKitBase.framework/Versions/A/Resources\
:/Users/luke/Library/Android/sdk/platform-tools\

# MOTD
source ~/.zsh/motd.zsh

# RVM
function rvm_reload() {
  rvm reload;
}
#rvm_reload

# MISC
export EDITOR=vim
export PEBBLE_PHONE=192.168.1.84
export THEOS_DEVICE_IP=192.168.1.33
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export CUCUMBER_COLORS=comment=cyan:passed_param=white

export LC_ALL=en_GB.UTF-8 export LANG=en_GB.UTF-8
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Luke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
