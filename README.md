# Dotfiles

Custom configuration files for various tools, including [neovim](https://neovim.io), zsh, tmux and more.

I run all of this in [iTerm](https://iterm2.com) on macOS.

Use [Fira Code](https://github.com/tonsky/FiraCode) to take full advantage of ligatures.

## Requirements

- [rcm](https://github.com/thoughtbot/rcm)
- zsh
  - [antibody](getantibody/antibody)
- [asdf](https://github.com/asdf-vm/asdf)
- tmux (2.1+)
  - [tmuxinator](https://github.com/tmuxinator/tmuxinator)
- neovim
  - [plug](https://github.com/junegunn/vim-plug)
- [fzf](https://github.com/junegunn/fzf)
  - [ag](https://github.com/ggreer/the_silver_searcher)

## Install

1. Install requirements (above)
2. Clone this repo `git clone [url] ~/.dotfiles`
3. Run `RCRC=~/.dotfiles/config/rcrc rcup -v`
4. Profit.

### Sources

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- [tony/tmux-config](https://github.com/tony/tmux-config)
- [robbyrussell/oh-my-zsh](https://github.com/tony/tmux-config)
- [xero/dotfiles](https://github.com/xero/dotfiles)

...And many more.
