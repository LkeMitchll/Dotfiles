export EDITOR=nvim
export XDG_CONFIG_HOME="/Users/Luke/.config"
export RCRC="$XDG_CONFIG_HOME/rcrc"
export KEYTIMEOUT=1
export HOMEBREW_BUNDLE_NO_LOCK=1
export PATH="/usr/local/bin:/usr/sbin:/sbin:/usr/bin:/bin:$PATH"

# Completion config
source $XDG_CONFIG_HOME/zsh/completion.zsh
# Custom prompt
source $XDG_CONFIG_HOME/zsh/prompt.zsh
# Aliases
source $XDG_CONFIG_HOME/zsh/aliases.zsh
# Scripts
for file in $XDG_CONFIG_HOME/zsh/lib/*; do
  source "$file"
done

# ASDF
. $HOME/.asdf/asdf.sh

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
