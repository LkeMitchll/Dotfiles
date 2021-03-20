local set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.o.clipboard = "unnamed"
vim.o.cursorline = true
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
vim.cmd("colorscheme interrobang")

-- nvim-treesitter
local treesitter = require 'nvim-treesitter.configs'
treesitter.setup {
  ensure_installed = 'maintained',
  highlight = { enable = true },
  indent = { enable = true }
}

-- nvim-lsp
local lspconfig = require 'lspconfig'
lspconfig.tsserver.setup{}
lspconfig.cssls.setup{}
lspconfig.html.setup{
  filetypes = {'html', 'htmldjango'}
}

set_keymap('n', '<leader>cd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
set_keymap('n', '<leader>d', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {})

-- nvim-compe
require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    ultisnips = true;
    nvim_treesitter = true;
  };
}
set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true; noremap = true })

-- vim-fugitive
set_keymap("n", "<leader>gs", ":G<CR>", {})

-- fzf.vim
set_keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {})

-- neoformat
set_keymap("n", "<leader>p", ":Neoformat<CR>", {})
