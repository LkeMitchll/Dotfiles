# ╭── /bin
# ╰─> ls

PREFIX="%{$fg[blue]%}╭──"
CWD="%{$fg[magenta]%}%~"
SUFFIX="%{$fg[blue]%}╰─> "
NEWLINE=$'\n'

PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}%{$fg[white]%}"
