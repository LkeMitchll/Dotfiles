# Based on oh-my-zsh themes wedisagree & bira
local vi_mode='$(vi_mode_prompt_info)'
local rbenv='%{$FG[008]%}| $(rbenv version | sed -e "s/ (set.*$//")'
local git=' |$(git_prompt_info)'
local git_status='$(git_prompt_status)'

PROMPT="
%{$fg[cyan]%}╭─-<< %{$fg[magenta]%}%c ${rbenv}%{$fg[cyan]%}${git}%{$reset_color%}${git_status}%{$reset_color%}%{$reset_color%}
%{$fg[cyan]%}╰─--> %{$reset_color%}"

MODE_INDICATOR="%{$fg[red]%}NORMAL "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Git branch status
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} D"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} U"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☀"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} A"

# Git file status
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} a"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} m"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} d"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} r"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} u"
