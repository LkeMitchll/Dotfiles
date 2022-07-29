global = vim.g
option = vim.opt
keymap = vim.keymap.set

-- General Config
global.mapleader = " "
option.clipboard = "unnamed"
option.cursorline = true
option.laststatus = 3
option.list = true
option.listchars.space = "·"
option.number = true
option.relativenumber = true
option.scrolloff = 999
option.shiftround = true
option.shiftwidth = 2
option.expandtab = true
option.smartindent = true
option.splitbelow = true

-- Keymaps
keymap("n", "<leader>e", ":Hexplore<CR>", {})
keymap("n", "<C-]>", ":cnext<CR>", {})

-- Plugins
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  --
  use("folke/tokyonight.nvim")
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    run = "python3 -m coq deps",
    requires = { { "ms-jpq/coq.artifacts", branch = "artifacts" } },
  })
  use("neovim/nvim-lspconfig")
  use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("nvim-treesitter/nvim-treesitter")
  use("glench/vim-jinja2-syntax")
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "TimUntersberger/neogit", requires = { "nvim-lua/plenary.nvim" } })
  use("echasnovski/mini.nvim")
  use({ "lkemitchll/kitty-runner.nvim", config = [[require("kitty-runner").setup()]] })
  use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
end)

-- Packer: Auto-compile changes
vim.api.nvim_create_augroup("packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer",
  pattern = { "init.lua" },
  command = "source <afile> | PackerCompile",
})

-- Plugin: Colorscheme
global.tokyonight_style = "night"
global.tokyonight_colors = { border = "bg_highlight" }
vim.cmd.colorscheme("tokyonight")

-- Plugin: COQ
global.coq_settings = {
  auto_start = "shut-up",
  keymap = { jump_to_mark = "<C-e>" },
}

-- Plugin: LSP
local lspconfig = require("lspconfig")
local servers = { "cssls", "html", "stylelint_lsp", "tsserver", "eslint" }

local on_attach = function(client)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  require("coq")().lsp_ensure_capabilities()
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
  })
end

keymap("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", {})

-- Plugin: null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },
})

-- Plugin: Treesitter
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
})

-- Plugin: Telescope
local ts_actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 120,
      },
    },
    mappings = {
      i = {
        ["<C-q>"] = ts_actions.smart_send_to_qflist + ts_actions.open_qflist,
      },
    },
  },
})

keymap("n", "<C-t>", ":Telescope find_files hidden=true<CR>", {})
keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})

-- Plugin: Neogit
require("neogit").setup({
  kind = "split",
  sections = {
    stashes = false,
  },
})

keymap("n", "<leader>gs", ":Neogit<CR>", {})

-- Plugin: Mini
local mini_plugins = { "comment", "jump", "jump2d", "pairs", "surround", "trailspace" }
for _, plugin in ipairs(mini_plugins) do
  require("mini." .. plugin).setup({})
end
