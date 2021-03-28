local set_keymap = vim.api.nvim_set_keymap
local command = vim.cmd

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
command("colorscheme interrobang")

-- nvim-treesitter
local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  indent = {enable = true}
}

-- nvim-lsp
local lspconfig = require "lspconfig"

lspconfig.cssls.setup {}
lspconfig.tsserver.setup {}
lspconfig.html.setup {filetypes = {"html", "htmldjango", "eruby"}}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    underline = true,
    signs = true
  }
)
-- linting & formatting
local nodePrefix = "./node_modules/.bin/"
function prettier(parser)
  return {
    formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath --parser=" .. parser,
    formatStdin = true
  }
end
local stylelint = {
  lintCommand = nodePrefix .. "stylelint --formatter unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = false,
  lintFormats = {"%f:%l:%c: %m [%t%*[a-z]]"}
}
local eslint = {
  lintCommand = nodePrefix .. "eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = true
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"lua", "css", "scss", "javascript"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {formatCommand = "luafmt -i 2"}
      },
      css = {prettier("css"), stylelint},
      scss = {prettier("scss"), stylelint},
      javascript = {prettier("babel"), eslint}
    }
  }
}

command [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
command [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
set_keymap("n", "<leader>cd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})

-- nvim-compe
require "compe".setup {
  autocomplete = true,
  min_length = 1,
  preselect = "enable",
  documentation = true,
  source = {
    ultisnips = true,
    nvim_lsp = true,
    buffer = true,
    path = true
  }
}
set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, noremap = true})

-- vim-fugitive
set_keymap("n", "<leader>gs", ":G<CR>", {})

-- telescope.nvim
local tsactions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-z>"] = tsactions.send_selected_to_qflist + tsactions.open_qflist
      }
    }
  }
}

set_keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope oldfiles<CR>", {})
set_keymap("n", "<leader>d", ":Telescope lsp_document_diagnostics<CR>", {})
