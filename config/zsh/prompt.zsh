PREFIX="%{$fg[cyan]%}╭─-<<"
CWD="%{$fg[magenta]%}%~"
SUFFIX="%{$fg[cyan]%}╰─->> %{$fg[white]%}"
NEWLINE=$'\n'

PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}"

function zle-line-init zle-keymap-select {
  RPS1="%F{8}${${KEYMAP/vicmd/┇N┇}/(main|viins)/┇I┇}"
  RPS2=$RPS1
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
