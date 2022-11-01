global = vim.g
option = vim.opt
keymap = vim.keymap.set

-- General Config
global.mapleader = " "
option.clipboard = "unnamed"
option.cursorline = true
option.laststatus = 3
option.list = true
option.listchars:append({ space = "·" })
option.number = true
option.relativenumber = true
option.scrolloff = 999
option.shiftround = true
option.shiftwidth = 2
option.expandtab = true
option.smartindent = true
option.splitbelow = true
option.statusline = "%#PmenuSel# %f %#CursorColumn# %= %m %#CursorLineNr# %y "

-- Keymaps
keymap("n", "<leader>e", ":Hexplore<CR>", {})
---- Navigate quickfix buffers
keymap("n", "<Right>", ":cnext<CR>", {})
keymap("n", "<Left>", ":cprevious<CR>", {})

-- Plugin: Colorscheme
require("tokyonight").setup({
  on_colors = function(colors)
    colors.border = colors.dark3
  end,
})
vim.cmd.colorscheme("tokyonight-night")

-- Plugin: COQ
global.coq_settings = {
  auto_start = "shut-up",
  display = { icons = { mode = "none" } },
  keymap = { jump_to_mark = "<C-e>" },
}

-- Plugin: Mason
require("mason").setup()

-- Plugin: nvim-lspconfig
local lspconfig = require("lspconfig")
local servers = { "cssls", "html", "tsserver" }
----- Plugin: mason-lspconfig
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local on_attach = function(client)
  require("coq")().lsp_ensure_capabilities()
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
  })
end

keymap("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", {})

-- Plugin: null_ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.stylelint,
  },
})
---- Plugin: mason-null-ls
require("mason-null-ls").setup({
  automatic_installation = true,
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
require("neogit").setup()
keymap("n", "<leader>gs", ":lua require('neogit').open({kind='split'})<CR>", {})

-- Plugin: kitty-runner
require("kitty-runner").setup()

-- Plugin: Mini
local mini_plugins = { "ai", "comment", "jump", "jump2d", "pairs", "surround", "trailspace" }
for _, plugin in ipairs(mini_plugins) do
  require("mini." .. plugin).setup({})
end
