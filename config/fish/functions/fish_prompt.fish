function fish_prompt
  echo (set_color blue)'╭─' (set_color magenta)(prompt_pwd)
  echo (set_color blue)'╰─' (set_color green)'$ '(set_color normal)
end
