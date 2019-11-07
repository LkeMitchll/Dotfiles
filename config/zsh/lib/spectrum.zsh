#! /bin/zsh
typeset -AHg FG

for color in {16..000}; do
  FG[$color]="%{[38;5;${color}m%}"
done

function spectrum_ls() {
  for code in {16..000}; do
    print -P -- "$code: %{$FG[$code]%}All work and no play...%{$reset_color%}"
  done
}
