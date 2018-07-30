# Dotfiles

Custom configuration files for various tools, including
[neovim](https://neovim.io), zsh and more.

I run all of this in [Kitty](https://github.com/kovidgoyal/kitty) on macOS.

Use [Fira Code](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) to take full advantage of
ligatures.

## Requirements

- [kitty](https://github.com/kovidgoyal/kitty)
- [rcm](https://github.com/thoughtbot/rcm)
- zsh
  - [antibody](getantibody/antibody)
- [asdf](https://github.com/asdf-vm/asdf)
- neovim
  - [plug](https://github.com/junegunn/vim-plug)
- [fzf](https://github.com/junegunn/fzf)

## Install

1. Install requirements (above)
2. Clone this repo `git clone [url] ~/.dotfiles`
3. Run `RCRC=~/.dotfiles/config/rcrc rcup -v`
4. Profit.
