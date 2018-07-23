# ╭── /bin
# ╰╴ɴ-> ls

PREFIX="%{$fg[cyan]%}╭──"
CWD="%{$fg[magenta]%}%~"
SUFFIX="%{$fg[cyan]%}╰╴%{$fg[white]%}"
VI_N="%{$fg[yellow]%}ɴ%{$fg[cyan]%}->"
VI_I="%{$fg[cyan]%}ɪ->"
NEWLINE=$'\n'

function zle-line-init zle-keymap-select {
  VIM="${${KEYMAP/vicmd/"${VI_N}"}/(main|viins)/"${VI_I}"}"
  PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}${VIM} "
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
