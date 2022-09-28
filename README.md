# Dotfiles

Custom configuration files for various tools, including [neovim], [fish] and more.

I run all of this in [kitty] on macOS, managed with [rcm].

## Requirements

- [homebrew]
- [kitty]
- [rcm]
- [fish]
- [neovim]

## Install

1. Install [homebrew]
2. Clone this repo `git clone git@github.com:LkeMitchll/Dotfiles.git ~/.dotfiles`
3. Run `brew bundle --file ~/.dotfiles/config/homebrew/Brewfile`
4. Run `RCRC=~/.dotfiles/rcrc rcup`

[neovim]: https://neovim.io
[kitty]: https://github.com/kovidgoyal/kitty
[homebrew]: https://brew.sh
[rcm]: https://github.com/thoughtbot/rcm
[fish]: https://fishshell.com

------------------------------------------------------------------------

## Notes

### Neovim

The primary plugins I use in Neovim are:

- [nvim-lspconfig] - The built-in language server client
- [coq] - a fast completion provider
- [telescope.nvim] - a super fast fuzzy finder
- [neogit] - an excellent git integration

[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[coq]: https://github.com/ms-jpq/coq_nvim
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[neogit]: https://github.com/TimUntersberger/neogit

### Kitty

I try to keep my [kitty config] light, but some things of note:

- My colorscheme, is based on [tokyo-night]
- I make use of [vim-kitty-navigator]

[kitty config]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/kitty/kitty.conf
[tokyo-night]: https://github.com/folke/tokyonight.nvim/tree/main/extras
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
