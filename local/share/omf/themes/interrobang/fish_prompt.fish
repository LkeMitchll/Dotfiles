# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/
set -g cyan (set_color cyan)
set -g yellow (set_color yellow)
set -g red (set_color -o red)
set -g green (set_color -o green)
set -g white (set_color -o white)
set -g blue (set_color -o blue)
set -g magenta (set_color -o magenta)
set -g normal (set_color normal)
set -g purple (set_color -o purple)

set -g FISH_GIT_PROMPT_EQUAL_REMOTE "$magenta=$normal"
set -g FISH_GIT_PROMPT_AHEAD_REMOTE "$greenA$normal"
set -g FISH_GIT_PROMPT_BEHIND_REMOTE "$magentaB$normal"
set -g FISH_GIT_PROMPT_DIVERGED_REMOTE "$redD$normal"

function __current_path
  echo -n (set_color magenta) (prompt_pwd) (set_color normal)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '| '$git_branch(set_color yellow)" D"
    else
      set git_info '| '$git_branch' |'
    end

    echo -e (set_color cyan) $git_info (set_color normal) 
  else
    echo -e ''
  end
end

function __git_ahead -d "git repository is ahead or behind origin"
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' ^/dev/null)

  if [ $status != 0 ]
    return
  end

  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead (count (for arg in $commits; echo $arg; end n| grep -v '^<'))

  switch "$ahead $behind"
    case '' # no upstream
        echo -e ''
    case '0 0' # equal to upstream
        echo "$FISH_GIT_PROMPT_EQUAL_REMOTE"
    case '* 0' # ahead of upstream
        echo "$FISH_GIT_PROMPT_AHEAD_REMOTE"
    case '0 *' # behind upstream
        echo "$FISH_GIT_PROMPT_BEHIND_REMOTE"
    case '*' # diverged from upstream
        echo "$FISH_GIT_PROMPT_DIVERGED_REMOTE"
  end
end

function __ruby_version
  if type "rvm-prompt" > /dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type "rbenv" > /dev/null 2>&1
    set ruby_version (rbenv version-name)
  else
    set ruby_version "system"
  end

  echo -n (set_color cyan)"| "$ruby_version(set_color normal)
end

function fish_prompt
  echo -n (set_color cyan)"╭─-<<"(set_color normal)
  __current_path
  __ruby_version
  __git_status
  __git_ahead
  echo (set_color cyan)"╰─--> "(set_color normal)
end
