local set_option = vim.api.nvim_set_option
local set_keymap = vim.api.nvim_set_keymap
local command = vim.cmd

vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.list = true
set_option("clipboard", "unnamed")
set_option("cursorline", true)
set_option("listchars", "eol:¬,space:·,trail:")
set_option("splitbelow", true)
set_option("smartindent", true)
set_option("expandtab", true)
set_option("shiftround", true)
set_option("softtabstop", 2)
set_option("tabstop", 2)
set_option("shiftwidth", 2)
set_option("completeopt", "menuone,noselect")
set_option("updatetime", 500)
command("set title")

require("packer").startup(
  function()
    use "wbthomason/packer.nvim"
    --
    use "airblade/vim-gitgutter"
    use "folke/tokyonight.nvim"
    use "ggandor/lightspeed.nvim"
    use "hoob3rt/lualine.nvim"
    use "hrsh7th/nvim-compe"
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

-- Keymaps
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})

-- Plugin: tokyonight.nvim
vim.g.tokyonight_style = "night"
command "colorscheme tokyonight"

-- Plugin: lualine.nvim
require("lualine").setup {
  options = {
    theme = "tokyonight"
  }
}

-- Plugin: nvim-treesitter
local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  indent = {enable = true}
}

-- Plugin: nvim-lspconfig
require("lsp")

set_keymap("n", "<leader>cd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})

-- Plugin: nvim-kitty-runner
vim.g.KittySwitchFocus = 1
vim.g.KittyFocusLayout = "tall:bias=60"

-- Plugin: nvim-compe
require "compe".setup {
  source = {
    vsnip = true,
    nvim_lsp = true,
    buffer = true,
    path = true
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
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})
