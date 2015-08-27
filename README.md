# Dotfiles

Custom configuration files for CLI apps on OS X.

Gathered from lots of places see below an incomplete list of sources.

I run all of this in iTerm 2 on OS X, although it should be transferable to any
UNIXy system.

I usually use 'Input Mono' as my font of choice.

![Preview](https://s3.amazonaws.com/f.cl.ly/items/3T2q153G0g1R2O1A1i3i/Screen%20Shot%202015-08-25%20at%2016.01.28.png)

**Requirements:**

- OS X
- tmux
- vim
- zsh (oh-my-zsh)
- Ruby + rubygems
- rcm
- thoughtbot/dotfiles

### Install

1. Install requirements (above)
2. Clone `thoughtbot/dotfiles`
2. Clone this repo: `git clone git@bitbucket.org:LkeMitchll/.dotfiles.git
   dotfiles-local`
3. Execute `RCRC=~/dotfiles-local/rcrc lsrc -v` (dry-run to look for errors)
4. Execute `RCRC=~/dotfiles-local/rcrc rcup -v`
5. Profit.

**Sources:**

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- [spf13/spf13-vim](https://github.com/spf13/spf13-vim)
- [tony/tmux-config](https://github.com/tony/tmux-config)
- [robbyrussell/oh-my-zsh](https://github.com/tony/tmux-config)
- [xero/dotfiles](https://github.com/xero/dotfiles)
- ... Many More
