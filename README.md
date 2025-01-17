# Dotfiles

Custom configuration files for various tools, including [Neovim], [Fish] and more.

I run all of this in [Ghostty] on macOS, managed with [RCM].

## Requirements

- mac OS
- [Homebrew]

[Neovim]: https://neovim.io
[Fish]: https://fishshell.com
[Ghostty]: https://ghostty.org
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

- [mini.nvim] - A collection of minimal but useful plugins
- [snacks.nvim] - Annother collection of minimal but useful plugins
- [lsp-zero.nvim] - Toolkit to configure LSP and snippets

[mini.deps]: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-deps.md
[lsp-zero.nvim]: https://github.com/VonHeikemen/lsp-zero.nvim
[mini.nvim]: https://github.com/echasnovski/mini.nvim
[snacks.nvim]: https://github.com/folke/snacks.nvim

### Ghostty

I try to keep my Ghostty config light, but some things of note:

- My colorscheme, is [tokyonight]
- I make use of [MD IO] as a font

[tokyonight]: https://github.com/folke/tokyonight.nvim/tree/main/extras
[MD IO]: https://io.mass-driver.com

### Fish

I use fish as it feels modern, and includes functionality that would otherwise
need a plugin (suggestions, substring-autocomplete etc.), some small things of
note:

- I use a two-line [prompt], loosely based on [bira]
- I use [FZF] to find things

[prompt]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/fish_prompt.fish
[bira]: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#bira
[FZF]: https://github.com/junegunn/fzf
