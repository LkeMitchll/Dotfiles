local global = vim.g
local option = vim.opt
local command = vim.cmd
local set_keymap = vim.api.nvim_set_keymap

global.mapleader = " "
option.number = true
option.relativenumber = true
option.list = true
option.clipboard = "unnamed"
option.cursorline = true
option.listchars = { space = "·", trail = "", extends = "#", eol = "¬" }
option.splitbelow = true
option.smartindent = true
option.expandtab = true
option.shiftround = true
option.softtabstop = 2
option.tabstop = 2
option.shiftwidth = 2
option.completeopt = { "menuone", "noselect" }
option.updatetime = 500
option.wrap = false
option.title = true

require("packer").startup(function()
  use("wbthomason/packer.nvim")
  --
  use("b3nj5m1n/kommentary")
  use("folke/tokyonight.nvim")
  use("ggandor/lightspeed.nvim")
  use("hoob3rt/lualine.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
  use("lkemitchll/vim-kitty-runner")
  use("neovim/nvim-lspconfig")
  use("tpope/vim-surround")
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    run = ":COQdeps",
    requires = { { "ms-jpq/coq.artifacts", branch = "artifacts" } },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = "maintained",
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  })
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("neogit").setup({})
    end,
  })
end)

-- LSP
require("lsp")

-- Theme
global.tokyonight_style = "night"
command("colorscheme tokyonight")
require("lualine").setup({ options = { theme = "tokyonight" } })

-- Keymaps
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})

-- Plugin: nvim-lspconfig
set_keymap("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting()<CR>", {})

-- Plugin: neogit
set_keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})

-- Plugin: telescope.nvim
set_keymap("n", "<C-t>", ":Telescope find_files hidden=true<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope oldfiles only_cwd=true<CR>", {})
set_keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>", {})
set_keymap("n", "<leader>d", ":Telescope lsp_document_diagnostics<CR>", {})
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})

-- Plugin: COQ
global.coq_settings = {
  auto_start = "shut-up",
  keymap = { jump_to_mark = "<C-e>" },
}
