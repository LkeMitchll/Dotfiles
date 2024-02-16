-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

-- Plugins
require("mini.deps").setup()
local add = require("mini.deps").add

-- mini.nvim
local mini_modules = {
  "ai", "basics", "bracketed", "comment", "completion", "files", "jump",
  "jump2d", "pairs", "pick", "splitjoin", "statusline", "surround", "trailspace"
}

for _, module in ipairs(mini_modules) do
  require("mini." .. module).setup()
end

vim.keymap.set("n", "<C-T>", ":Pick files<CR>")
vim.keymap.set("n", "<C-P>", ":Pick grep_live<CR>")
vim.keymap.set("n", "-", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>")
vim.keymap.set("n", "<BS>", ":lua MiniTrailspace.trim()<CR>")

-- tokyonight
add("folke/tokyonight.nvim")
vim.cmd.colorscheme("tokyonight-night")

-- nvim-treesitter
add("nvim-treesitter/nvim-treesitter")
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true }
})

vim.filetype.add({ extension = { njk = "htmldjango" } })

-- lsp-zero & mason
add({
  source = "VonHeikemen/lsp-zero.nvim",
  checkout = "v3.x",
  depends = { "neovim/nvim-lspconfig", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
})
local lsp = require("lsp-zero")

lsp.on_attach(function()
  lsp.default_keymaps({ preserve_mappings = false })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require("mason").setup()
require("mason-lspconfig").setup({ handlers = { lsp.default_setup } })

-- neogit
add({ source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } })
require("neogit").setup()

vim.keymap.set("n", "<C-G>", ":Neogit kind=split<CR>")

-- vim-kitty-navigator
add("knubie/vim-kitty-navigator")

-- kitty-runner
add("lkemitchll/kitty-runner.nvim")
require("kitty-runner").setup()

-- which-key
add("folke/which-key.nvim")
require("which-key").setup()
