function fish_right_prompt
  set -l git_branch (fish_git_prompt)
  set -l branch_length (string length $git_branch)

  if test -n "$git_branch"
    if test "$branch_length" -gt 15
      echo (set_color brblack)(string sub --length 15 $git_branch)"..."
    else
      echo (set_color brblack)$git_branch
    end
  end
end
