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

-- Plugin: LSP
local lspconfig = require("lspconfig")
local servers = { "cssls", "html", "tsserver", "vuels" }

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
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.fish,
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
require("neogit").setup()
keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})

-- Plugin: kitty-runner
require("kitty-runner").setup()

-- Plugin: Mini
local mini_plugins = { "ai", "comment", "jump", "jump2d", "pairs", "surround", "trailspace" }
for _, plugin in ipairs(mini_plugins) do
  require("mini." .. plugin).setup({})
end
