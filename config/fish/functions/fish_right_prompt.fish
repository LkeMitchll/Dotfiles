function fish_right_prompt
  set -l git_branch (hub branch ^/dev/null | sed -n '/\* /s///p')
  echo (set_color brblack)$git_branch
end
