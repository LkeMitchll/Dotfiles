-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.listchars:append({ space = "·" })

-- Plugins
-- tokyonight: Theme
vim.cmd.colorscheme("tokyonight-night")

-- nvim-treesitter: Syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true }
})

vim.filetype.add({ extension = { njk = "htmldjango" } })

-- mini.nvim: Swiss army knife of plugins
require("mini.basics").setup({ options = { extra_ui = true } })

local mini_modules = {
  "ai", "bracketed", "comment", "completion", "files", "jump", "jump2d", "move",
  "operators", "pairs", "pick", "splitjoin", "statusline", "surround", "trailspace"
}

for _, module in ipairs(mini_modules) do
  require("mini." .. module).setup()
end

vim.keymap.set("n", "<C-T>", ":Pick files<CR>")
vim.keymap.set("n", "<C-P>", ":Pick grep_live<CR>")
vim.keymap.set("n", "-", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>")
vim.keymap.set("n", "<BS>", ":lua MiniTrailspace.trim()<CR>")

-- lsp-zero: Setup LSP
local lsp = require("lsp-zero")

lsp.on_attach(function()
  lsp.default_keymaps({ preserve_mappings = false })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- mason: Install LSPs
require("mason").setup()
require("mason-lspconfig").setup({ handlers = { lsp.default_setup } })

-- neogit: Git Client
require("neogit").setup()
vim.keymap.set("n", "<C-G>", ":Neogit kind=split<CR>")

-- kitty-runner: Run commands in a kitty window
require("kitty-runner").setup()

-- which-key: Help with keymaps
require("which-key").setup()
