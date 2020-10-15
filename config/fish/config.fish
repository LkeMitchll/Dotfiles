set -e PATH
set -gx PATH /usr/local/bin /usr/sbin /sbin /usr/bin /bin /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

set -gx EDITOR nvim
set -gx HOMEBREW_BUNDLE_NO_LOCK 1
set -gx KEYTIMEOUT 1
set -gx RCRC "$XDG_CONFIG_HOME/rcrc"
set -gx XDG_CONFIG_HOME "/Users/luke/.config"
bind \cn accept-autosuggestion

source ~/.config/fish/aliases.fish
source ~/.config/fish/theme.fish

# ASDF
source ~/.asdf/asdf.fish

# FZF
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'

# Android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx PATH $PATH $ANDROID_HOME/tools
set -gx PATH $PATH $ANDROID_HOME/tools/bin
set -gx PATH $PATH $ANDROID_HOME/platform-tools
