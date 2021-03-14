vim.g.mapleader = " "
vim.o.clipboard = "unnamed"
vim.o.cursorline = true
vim.o.relativenumber = true
vim.wo.list = true
vim.o.listchars = "eol:¬,space:·,trail:"
vim.o.splitbelow = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.cmd("colorscheme interrobang")

-- vim-fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {})

-- coc.nvim
vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", {})
vim.api.nvim_set_keymap("n", "<C-t>", ":CocList files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ag", ":CocList grep<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>b", ":CocList buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>(coc-definition)", {})
vim.api.nvim_set_keymap("n", "<leader>d", ":CocList diagnostics<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>p", ":call CocAction('format')<CR>", {})
