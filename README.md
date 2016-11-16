# Dotfiles

Custom configuration files for CLI apps on OS X.

Gathered from lots of places see below an incomplete list of sources.

I run all of this in iTerm 2 on OS X, although it should be transferable to any
UNIXy system.

Use 'Fira Code' to take full advantage of ligatures.

**Requirements:**

- tmux (2.1+)
  - [tpm](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
  - [tmuxinator](https://github.com/tmuxinator/tmuxinator)
  - [tmux-spotify-info](https://github.com/dickeyxxx/tmux-spotify-info) (Display
    spotify now playing)
- vim
  - [vim-plug](https://github.com/junegunn/vim-plug) (vim plugin manager)
- zsh 
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [rcm](https://github.com/thoughtbot/rcm)

### Install

1. Install requirements (above)
2. Clone this repo
4. Execute `RCRC=~/dotfiles/rcrc rcup -v`
5. Profit.

Then go ahead and initialise the tmux and vim plugins.

**Sources:**

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- [spf13/spf13-vim](https://github.com/spf13/spf13-vim)
- [tony/tmux-config](https://github.com/tony/tmux-config)
- [robbyrussell/oh-my-zsh](https://github.com/tony/tmux-config)
- [xero/dotfiles](https://github.com/xero/dotfiles)
- ... Many More
