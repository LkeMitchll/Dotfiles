# Dotfiles

Custom configuration files for various tools, including [Neovim], [Fish] and more.

I run all of this in [Kitty] on mac OS, managed with [RCM].

## Requirements

- mac OS
- [Homebrew]

[Neovim]: https://neovim.io
[Fish]: https://fishshell.com
[Kitty]: https://github.com/kovidgoyal/kitty
[Homebrew]: https://brew.sh
[RCM]: https://github.com/thoughtbot/rcm

## Install

1. Clone this repo `git clone git@github.com:LkeMitchll/Dotfiles.git ~/.dotfiles`.
2. Install [Homebrew].
3. Run `cd ~/.dotfiles & chmod +x ./setup.sh & ./setup.sh`.

---

## Notes

### Neovim

I try to keep my Neovim setup as minimal as I can, I manage my plugins using
[mini.deps]. The primary plugins I use in Neovim are:

- [lsp-zero.nvim] - Toolkit to configure LSP and snippets
- [mini.nvim] - A collection of minimal but useful plugins
- [neogit] - An excellent git integration

[mini.deps]: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-deps.md
[lsp-zero.nvim]: https://github.com/VonHeikemen/lsp-zero.nvim
[mini.nvim]: https://github.com/echasnovski/mini.nvim
[neogit]: https://github.com/TimUntersberger/neogit

### Kitty

I try to keep my [Kitty config] light, but some things of note:

- My colorscheme, is [tokyonight]
- I make use of [vim-kitty-navigator]

[Kitty config]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/kitty/kitty.conf
[tokyonight]: https://github.com/folke/tokyonight.nvim/tree/main/extras
[vim-kitty-navigator]: https://github.com/knubie/vim-kitty-navigator

### Fish

I use fish as it feels modern, and includes functionality that would otherwise
need a plugin (suggestions, substring-autocomplete etc.), some small things of
note:

- I wrote a simple script to start [Kitty sessions]
- I use a two-line [prompt], loosely based on [bira]

[Kitty sessions]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/session.fish
[prompt]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/fish_prompt.fish
[bira]: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#bira
