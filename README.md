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
2. Run `cd ~/.dotfiles & chmod +x ./setup.sh & ./setup.sh`.
3. If all went well, run `nvim` to install plugins.

---

## Notes

### Neovim

I try to keep my neovim setup as minimal as I can, I manage my plugins using
[lazy.nvim]. The primary plugins I use in Neovim are:

- [lsp-zero.nvim] - automatically configures LSP and snippets
- [mini.nvim] - A collection on minimal but useful plugins
- [neogit] - An excellent git integration

[lazy.nvim]: https://github.com/folke/lazy.nvim
[lsp-zero.nvim]: https://github.com/VonHeikemen/lsp-zero.nvim
[mini.nvim]: https://github.com/echasnovski/mini.nvim
[neogit]: https://github.com/TimUntersberger/neogit

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
