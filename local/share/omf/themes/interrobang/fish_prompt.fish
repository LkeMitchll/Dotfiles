# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/
function __current_path
  if [ (prompt_pwd) = "~" ]
    echo -n (set_color green) "Home" (set_color normal)
  else
    echo -n (set_color magenta) (prompt_pwd) (set_color normal)
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_branch_name_length
  echo (command echo -n (_git_branch_name) | wc -c)
end

function _tmux_current_width
  echo (command tmux display -p "#{pane_width}")
end

function __git_branch
  echo -n (set_color cyan) '| '
  if [ (_git_branch_name) ]
    if  [ (_git_branch_name_length) -ge 20 ]
      if [ (_tmux_current_width) -lt 65 ]
        set git_branch (set_color red)(command echo (_git_branch_name) | head -c 17)"..."
      else
        set git_branch (_git_branch_name)
      end
    else
      set git_branch (_git_branch_name)
    end

    set git_info $git_branch
    echo -n (set_color cyan)$git_info (set_color normal)
  else
    echo -n ''
  end
end

function __git_status
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l ahead  "$green>= $normal"
  set -l behind "$red<= $normal"
  set -l diverged "$red!= $normal"
  set -l dirty "$yellow*$normal"
  set -l none ""

  if git_is_touched
    echo (set_color yellow)"$dirty" (set_color cyan)"|"(set_color normal)
  else
    echo (set_color green)(git_ahead $ahead $behind $diverged $none)(set_color cyan)'|'(set_color normal)
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
  __git_branch
  __git_status
  echo (set_color cyan)"╰─--> "(set_color normal)
end
