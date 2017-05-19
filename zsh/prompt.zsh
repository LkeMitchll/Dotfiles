function git_current_branch() {
  local ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  local branch=${ref#refs/heads/}
  local length=${#branch}
  local tmux_width=$(command tmux display -t 1 -p "#{pane_width}")

  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null)
  fi
  if [[ $length -gt 18 ]];
  then
    if [[ $tmux_width -lt 65 ]];
    then
      clipped=$(command echo ${branch} | cut -c-12)
      echo "${clipped}..."
    else
      echo ${branch}
    fi
  else
    echo ${branch}
  fi
}

function git_status() {
  local STATUS=''
  local FLAGS
  local DIRTY="%{$fg[yellow]%}*"
  local CLEAN=""
  FLAGS=('--porcelain')
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

  if [[ -n $STATUS ]]; then
    echo "$DIRTY"
  else
    echo "$CLEAN"
  fi
}

function ruby_version() {
  if which rvm-prompt &> /dev/null; then
    rvm-prompt i v g
  else
    if which rbenv &> /dev/null; then
      rbenv version | sed -e "s/ (set.*$//"
    fi
  fi
}

function precmd {
  local PREFIX="%{$fg[cyan]%}╭─-<<"
  local CWD="%{$fg[magenta]%}%~"
  local RUBY="%{$fg[cyan]%}| $(ruby_version) |"
  local SUFFIX="%{$fg[cyan]%}╰─--> %{$fg[white]%}"

  PROMPT="${PREFIX} ${CWD} ${RUBY} $(git_current_branch) $(git_status)
${SUFFIX}"
}
