local set_keymap = vim.api.nvim_set_keymap
local command = vim.cmd

vim.g.mapleader = " "
vim.o.clipboard = "unnamed"
vim.o.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.list = true
vim.o.listchars = "eol:¬,space:·,trail:"
vim.o.splitbelow = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.completeopt = "menuone,noselect"
command "set nowrap"

require("packer").startup(
  function()
    use "wbthomason/packer.nvim"
    --
    use "airblade/vim-gitgutter"
    use "folke/tokyonight.nvim"
    use "hoob3rt/lualine.nvim"
    use "hrsh7th/nvim-compe"
    use "justinmk/vim-sneak"
    use "knubie/vim-kitty-navigator"
    use "lkemitchll/vim-kitty-runner"
    use "neovim/nvim-lspconfig"
    use "nvim-treesitter/nvim-treesitter"
    use "tpope/vim-commentary"
    use "tpope/vim-fugitive"
    use "tpope/vim-sensible"
    use "tpope/vim-surround"
    use {
      "hrsh7th/vim-vsnip",
      requires = {"hrsh7th/vim-vsnip-integ", "rafamadriz/friendly-snippets"}
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}
    }
  end
)

-- Plugin: tokyonight.nvim
vim.g.tokyonight_style = "night"
command "colorscheme tokyonight"

-- Plugin: lualine.nvim
require("lualine").setup {
  options = {
    theme = "tokyonight"
  }
}

-- Plugin: vim-sneak
vim.g["sneak#label"] = 1

-- Plugin: nvim-treesitter
local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  indent = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}

-- Plugin: nvim-lspconfig
require("lsp")

-- Plugin: nvim-kitty-runner
vim.g.KittySwitchFocus = 1
vim.g.KittyFocusLayout = "tall:bias=60"

-- show lsp diagnostics on hover
command [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
command [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

set_keymap("n", "<leader>cd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})

-- Plugin: nvim-compe
require "compe".setup {
  autocomplete = true,
  min_length = 1,
  preselect = "enable",
  documentation = true,
  source = {
    vsnip = true,
    nvim_lsp = true,
    buffer = true,
    path = true,
    calc = true
  }
}

set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, noremap = true})
set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, noremap = true})

-- Plugin: vim-fugitive
set_keymap("n", "<leader>gs", ":G<CR>", {})

-- Plugin: telescope.nvim
local tsactions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-z>"] = tsactions.send_selected_to_qflist + tsactions.open_qflist
      }
    }
  }
}

set_keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope oldfiles<CR>", {})
set_keymap("n", "<leader>d", ":Telescope lsp_document_diagnostics<CR>", {})
