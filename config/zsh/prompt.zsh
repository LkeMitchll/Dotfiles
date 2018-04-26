PREFIX="%{$fg[cyan]%}╭─-<<"
CWD="%{$fg[magenta]%}%~"
SUFFIX="%{$fg[cyan]%}╰─->> %{$fg[white]%}"
NEWLINE=$'\n'

PROMPT="${PREFIX} ${CWD}${NEWLINE}${SUFFIX}"
