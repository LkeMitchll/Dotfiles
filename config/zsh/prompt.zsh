# ╭── /bin
# ╰╴ɴ-> ls

PREFIX="%{$fg[blue]%}╭──"
CWD="%{$fg[magenta]%}%~"
SUFFIX="%{$fg[blue]%}╰╴%{$fg[white]%}"
VI_N="%{$fg[yellow]%}ɴ%{$fg[blue]%}->"
VI_I="%{$fg[blue]%}ɪ->"
NEWLINE=$'\n'

function zle-line-init zle-keymap-select {
  VIM="${${KEYMAP/vicmd/"${VI_N}"}/(main|viins)/"${VI_I}"}"
  PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}${VIM} "
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
