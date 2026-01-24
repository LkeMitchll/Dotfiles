-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.cmdheight = 0
vim.opt.scrolloff = 999

-- Plugins
vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/rafamadriz/friendly-snippets",
})

-- Mason
require("mason").setup()

-- Language Servers
vim.lsp.enable({ "biome", "cssls", "html", "jsonls", "lua_ls", "ts_ls" })
vim.diagnostic.config({ virtual_text = { current_line = true } })

---- nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = { "ipkg" },
  highlight = { enable = true }
})

---- mini
---- General setup
local mini_modules = {
  "ai", "basics", "bracketed", "cmdline", "completion", "diff", "files", "icons", "jump",
  "jump2d", "pairs", "pick", "splitjoin", "statusline", "surround", "trailspace"
}
for _, module in ipairs(mini_modules) do
  require("mini." .. module).setup()
end
---- Setup snippets
local snippets = require("mini.snippets")
snippets.setup({
  snippets = { require("mini.snippets").gen_loader.from_lang() }
})
snippets.start_lsp_server()

---- snacks
require("snacks").setup({
  gitbrowse = { enabled = true },
  indent = { enabled = true, animate = { enabled = false } },
  lazygit = { enabled = true },
  statuscolumn = { enabled = true }
})

---- tokyonight
vim.cmd.colorscheme("tokyonight-night")

-- Keymaps
---- LSP
vim.keymap.set("n", "<F3>", ":lua vim.lsp.buf.format()<CR>")
---- Mini
vim.keymap.set("n", "<C-T>", ":Pick files<CR>")
vim.keymap.set("n", "<C-P>", ":Pick grep_live<CR>")
vim.keymap.set("n", "-", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>")
vim.keymap.set("n", "<BS>", ":lua MiniTrailspace.trim()<CR>")
---- snacks
vim.keymap.set("n", "<leader>g", ":lua Snacks.gitbrowse()<CR>")
vim.keymap.set("n", "<C-G>", ":lua Snacks.lazygit()<CR>")
---- which-key
vim.keymap.set("n", "`", ":WhichKey<CR>")
