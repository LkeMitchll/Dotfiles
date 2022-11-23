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

2. Clone this repo `git clone git@github.com:LkeMitchll/Dotfiles.git ~/.dotfiles`
3. Run `/opt/homebrew/bin/brew bundle --file ~/.dotfiles/config/homebrew/Brewfile` to install dependencies.
5. Run `chsh -s /opt/homebrew/bin/fish` to change the default shell.
4. Run `RCRC=~/.dotfiles/rcrc /opt/homebrew/bin/rcup` to symlink these dotfiles.
5. Run `vish init` to clone neovim plugins.
6. Open `kitty.app`.

---

## Notes

### Neovim

To manage my plugins I wrote a little [fish function], that wraps the built-in
[package loader]. The primary plugins I use in Neovim are:

- [nvim-lspconfig] - the built-in language server (LSP) client
  - [mason.nvim] - install and configure LSPs
- [nvim-cmp] - a completion engine
  - [nvim-snippy] - provides snippets
- [telescope.nvim] - a super fast fuzzy finder
- [neogit] - an excellent git integration

You can see a full list of the plugins I have installed in the [submodules file].

[fish function]: https://github.com/LkeMitchll/Dotfiles/blob/main/config/fish/functions/vish.fish
[package loader]: https://neovim.io/doc/user/repeat.html#using-scripts

[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[mason.nvim]: https://github.com/williamboman/mason.nvim
[nvim-cmp]: https://github.com/knubie/nvim-cmp
[nvim-snippy]: https://github.com/dcampos/nvim-snippy
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[neogit]: https://github.com/TimUntersberger/neogit

[submodules file]: https://github.com/LkeMitchll/Dotfiles/blob/main/.gitmodules

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
