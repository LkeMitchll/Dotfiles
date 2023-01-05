function fish_prompt
    echo (set_color blue)'╭─' (set_color magenta)(prompt_pwd)
    echo (set_color blue)'╰─ '(set_color green)'$ '(set_color normal)
end

function fish_right_prompt
    if test -n "$IS_RUNNER" && test $IS_RUNNER = true
        echo (set_color yellow)"[*]"(set_color normal)
    end
end
