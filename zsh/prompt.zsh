function git_current_branch() {
  local ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  local prefix="%{$fg[cyan]%}| "
  local branch=${ref#refs/heads/}
  local length=${#branch}
  local tmux_width=

  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null)
  fi

  # If a repo exists add prefix
  if [[ $branch ]];
  then
    branch=${prefix}${ref#refs/heads/}
  else
    branch=""
  fi

  # If tmux is running measure the pane width
  if tmux info &> /dev/null; then
    tmux_width=$(command tmux display -t 1 -p "#{pane_width}")
  else
    tmux_width=""
  fi

  # If branch name is long concat on narrow tmux panes
  if [[ $length -gt 18 ]];
  then
    if [[ $tmux_width && $tmux_width -lt 70 ]];
    then
      clipped=$(command echo ${branch} | cut -c-20)
      echo "${clipped}..."
    else
      echo ${branch}
    fi
  else
    echo ${branch}
  fi
}

function git_status() {
  local STATUS=""
  local DIRTY="%{$fg[yellow]%}⊛"
  local CLEAN="%{$fg[green]%}⊝"
  local FLAGS=("--porcelain")

  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

  if [[ $(git_current_branch) ]]; then
    if [[ $STATUS ]]; then
      echo "$DIRTY"
    else
      echo "$CLEAN"
    fi
  fi
}

function precmd {
  local PREFIX="%{$fg[cyan]%}╭─-<<"
  local CWD="%{$fg[magenta]%}%~"
  local GIT="$(git_current_branch) $(git_status)"
  local SUFFIX="%{$fg[cyan]%}╰─--> %{$fg[white]%}"

  PROMPT="${PREFIX} ${CWD} ${GIT}
${SUFFIX}"
}
