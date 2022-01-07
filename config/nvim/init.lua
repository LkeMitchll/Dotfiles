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
option.listchars = { space = "·", trail = "~", extends = "#", eol = "¬" }
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
  use("nvim-lua/plenary.nvim")
  --
  use("folke/tokyonight.nvim")
  use("ggandor/lightspeed.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("lkemitchll/vim-kitty-runner")
  use("neovim/nvim-lspconfig")
  use("tpope/vim-surround")
  use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "lewis6991/gitsigns.nvim",
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
    requires = { "nvim-lua/popup.nvim" },
  })
  use({
    "TimUntersberger/neogit",
    config = function()
      require("neogit").setup({})
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
end)

-- LSP
local lspconfig = require("lspconfig")
local servers = { "cssls", "html", "stylelint_lsp", "tsserver", "eslint", "tailwindcss" }

on_attach = function(client)
  -- Always use the first formatter
  client.resolved_capabilities.document_formatting = false
  -- Plugin: coq_nvim
  require("coq")().lsp_ensure_capabilities()
end

-- Init servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
  })
end

set_keymap("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting()<CR>", {})
set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", {})

-- Theme
global.tokyonight_style = "night"
command("colorscheme tokyonight")
require("lualine").setup({ options = { theme = "tokyonight" } })

-- Keymaps
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})

-- Plugin: COQ
global.coq_settings = {
  auto_start = "shut-up",
  keymap = { jump_to_mark = "<C-e>" },
}

-- Plugin: neogit
set_keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})

-- Plugin: null_ls (linting & formatting)
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier,
  },
})

-- Plugin: telescope.nvim
set_keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope oldfiles only_cwd=true<CR>", {})
set_keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>", {})
set_keymap("n", "<leader>d", ":Telescope lsp_document_diagnostics<CR>", {})
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})
