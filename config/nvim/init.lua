-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.listchars:append({ space = "·" })

-- Plugins
require("mini.deps").setup()
local add = require("mini.deps").add

-- mini.nvim
add({ source = "echasnovski/mini.nvim", depends = { "rafamadriz/friendly-snippets" }})

local mini_modules = {
  "ai", "bracketed", "completion", "diff", "files", "git", "icons", "jump",
  "jump2d", "pairs", "pick", "splitjoin", "statusline", "surround", "trailspace"
}

for _, module in ipairs(mini_modules) do
  require("mini." .. module).setup()
end

require("mini.basics").setup({ options = { extra_ui = true } })

require("mini.snippets").setup({
  snippets = { require('mini.snippets').gen_loader.from_lang() }
})

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

vim.filetype.add({ extension = { njk = "liquid" } })

-- lsp-zero: nvim-lspconfig, mason
add({
  source = "VonHeikemen/lsp-zero.nvim",
  checkout = "v4.x",
  depends = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
})

---- Setup LSP
local lsp_zero = require('lsp-zero')

local lsp_attach = function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end

lsp_zero.extend_lspconfig({ lsp_attach = lsp_attach, sign_text = true })

---- Setup mason
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        on_init = function(client)
          lsp_zero.nvim_lua_settings(client, {})
        end,
      })
    end,
  },
})

-- neogit
add({ source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } })
require("neogit").setup()

vim.keymap.set("n", "<C-G>", ":Neogit kind=split<CR>")

-- kitty-runner
add({ source = "lkemitchll/kitty-runner.nvim", depends = { "knubie/vim-kitty-navigator" } })
require("kitty-runner").setup()

-- which-key
add("folke/which-key.nvim")
require("which-key").setup()

-- copilot
add("github/copilot.vim")
