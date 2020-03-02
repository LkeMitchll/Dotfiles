# ╭── ~/.config
# ╰── ls

PREFIX="%{$fg[blue]%}╭──"
CWD="%{$fg[magenta]%}%~ %{$fg[blue]%}"
SUFFIX="%{$fg[blue]%}╰── "
NEWLINE=$'\n'

PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}%{$fg[white]%}"
