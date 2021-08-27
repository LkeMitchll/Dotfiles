# Dotfiles

Custom configuration files for various tools, including [neovim], [fish] and more.

I run all of this in [Kitty] on macOS.

Use [Recursive Mono] to take full advantage of ligatures.

## Requirements

- [homebrew]
- [kitty]
- [rcm]
- [fish]
  - [fisher]
- [neovim]
  - [packer]
- [asdf]

## Install

1. Install requirements (above)
2. Clone this repo `git clone [url] ~/.dotfiles`
3. Run `brew bundle --file ~/.dotfiles/Brewfile`
4. Run `RCRC=~/.dotfiles/config/rcrc rcup -v`

------------------------------------------------------------------------

## Notes

### Neovim

The primary plugins I use in Neovim are:

- [nvim-lspconfig] - The built-in language server client
- [coq] - a fast completion provider
- [telescope.nvim] - a super fast fuzzy finder
- [neogit] - an excellent git integration

You can see a full list of the Neovim plugins I use in my [neovim config]

### Kitty

I try to keep my [kitty config] light, but some things of note:

- My colorscheme, is based on [tokyo-night]
- I make use of [vim-kitty-navigator]

### Fish

I use fish as it feels modern, and includes functionality that would otherwise
need a plugin (suggestions, substring-autocomplete etc.), some small things of
note:

- I wrote a simple script to start [kitty sessions]
- I use a two-line [prompt], based on [bira]

[neovim]: https://neovim.io
[packer]: https://github.com/wbthomason/packer.nvim
[Kitty]: https://github.com/kovidgoyal/kitty
[Recursive Mono]: https://github.com/arrowtype/recursive
[homebrew]: https://brew.sh
[rcm]: https://github.com/thoughtbot/rcm
[fish]: https://fishshell.com
[fisher]: https://github.com/jorgebucaran/fisher
[asdf]: https://github.com/asdf-vm/asdf
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[coq]: https://github.com/ms-jpq/coq_nvim
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[neogit]: https://github.com/TimUntersberger/neogit
[neovim config]: https://github.com/LkeMitchll/Dotfiles/tree/main/config/nvim/init.lua
[theme]: https://github.com/LkeMitchll/vim-interrobang
[kitty config]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/kitty/kitty.conf
[tokyo-night]: https://github.com/davidmathers/tokyo-night-kitty-theme
[vim-kitty-navigator]: https://github.com/knubie/vim-kitty-navigator
[kitty sessions]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/session.fish
[prompt]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/fish_prompt.fish
[bira]: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#bira
