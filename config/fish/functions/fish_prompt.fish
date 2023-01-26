function fish_prompt
  if test -n "$IS_RUNNER" && test $IS_RUNNER = true
    set runner_indicator (set_color yellow)"[•]"
  end
  echo (set_color blue)'╭─' (set_color magenta)(prompt_pwd) $runner_indicator
  echo (set_color blue)'╰─' (set_color green)'$ '(set_color normal)
end
