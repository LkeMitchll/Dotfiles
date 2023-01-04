# Dotfiles

Custom configuration files for various tools, including [neovim], [fish] and more.

I run all of this in [kitty] on macOS, managed with [rcm].

## Requirements

- macOS
- `git`
- [homebrew]

[neovim]: https://neovim.io
[fish]: https://fishshell.com
[kitty]: https://github.com/kovidgoyal/kitty
[homebrew]: https://brew.sh
[rcm]: https://github.com/thoughtbot/rcm

## Install

1. Clone this repo `git clone git@github.com:LkeMitchll/Dotfiles.git ~/.dotfiles`
2. Run `/opt/homebrew/bin/brew bundle --file ~/.dotfiles/config/homebrew/Brewfile` to install dependencies.
3. Run `/opt/homebrew/bin/rcup` to symlink these dotfiles.
4. Run `git clone git@github.com:folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim`
5. Run `chsh -s /opt/homebrew/bin/fish` to change the default shell.
6. Open `kitty.app`.

---

## Notes

### Neovim

I try to keep my neovim setup as minimal as I can, I manage my plugins using
[lazy.nvim]. The primary plugins I use in Neovim are:

- [lsp-zero.nvim] - automatically configures LSP and snippets
- [telescope.nvim] - a super fast fuzzy finder
- [neogit] - an excellent git integration

You can see a full list of the plugins I have installed in the [neovim config].

[lazy.nvim]: https://github.com/folke/lazy.nvim
[lsp-zero.nvim]: https://github.com/VonHeikemen/lsp-zero.nvim
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[neogit]: https://github.com/TimUntersberger/neogit

[neovim config]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/nvim/init.lua

### Kitty

I try to keep my [kitty config] light, but some things of note:

- My colorscheme, is [tokyonight]
- I make use of [vim-kitty-navigator]

[kitty config]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/kitty/kitty.conf
[tokyonight]: https://github.com/folke/tokyonight.nvim/tree/main/extras
[vim-kitty-navigator]: https://github.com/knubie/vim-kitty-navigator

### Fish

I use fish as it feels modern, and includes functionality that would otherwise
need a plugin (suggestions, substring-autocomplete etc.), some small things of
note:

- I wrote a simple script to start [kitty sessions]
- I use a two-line [prompt], loosely based on [bira]

[kitty sessions]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/session.fish
[prompt]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/fish_prompt.fish
[bira]: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#bira
