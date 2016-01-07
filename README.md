# Dotfiles

Custom configuration files for CLI apps on OS X.

Gathered from lots of places see below an incomplete list of sources.

I run all of this in iTerm 2 on OS X, although it should be transferable to any
UNIXy system.

I usually use 'Input Mono' as my font of choice.

![Preview](http://f.cl.ly/items/2V072Y2j333w0q0X2O1l/Screen%20Shot%202015-11-24%20at%2011.32.07.png)

**Requirements:**

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- tmux (2.1+)
  - [tpm](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
  - [tmuxinator](https://github.com/tmuxinator/tmuxinato)
  - [tmux-spotify-info](https://github.com/dickeyxxx/tmux-spotify-info) (Display
    spotify now playing)
- vim
  - [vim-plug](https://github.com/junegunn/vim-plug) (vim plugin manager)
- zsh 
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [rcm](https://github.com/thoughtbot/rcm)
- [Spacegray](https://github.com/ajh17/Spacegray.vim) theme (for iTerm and Vim)

### Install

1. Install requirements (above)
2. Clone `thoughtbot/dotfiles`
2. Clone this repo: `git clone git@bitbucket.org:LkeMitchll/.dotfiles.git
   dotfiles-local`
3. Execute `RCRC=~/dotfiles-local/rcrc lsrc -v` (dry-run to look for errors)
4. Execute `RCRC=~/dotfiles-local/rcrc rcup -v`
5. Profit.

Then go ahead and initialise the tmux and vim plugins.

**Sources:**

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- [spf13/spf13-vim](https://github.com/spf13/spf13-vim)
- [tony/tmux-config](https://github.com/tony/tmux-config)
- [robbyrussell/oh-my-zsh](https://github.com/tony/tmux-config)
- [xero/dotfiles](https://github.com/xero/dotfiles)
- ... Many More
