-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

-- Plugins
require("mini.deps").setup()
local add = require("mini.deps").add

-- mini.nvim
add("echasnovski/mini.nvim")
local mini_modules = {
  "ai", "basics", "bracketed", "diff", "files", "git", "icons", "jump", "jump2d",
  "pairs", "pick", "splitjoin", "statusline", "surround", "trailspace"
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

vim.filetype.add({ extension = { njk = "liquid" } })

-- lsp-zero: nvim-lspconfig, mason, nvim-cmp, luasnip
add({
  source = "VonHeikemen/lsp-zero.nvim",
  checkout = "v4.x",
  depends = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets"
  }
})

---- Setup LSP
local lsp_zero = require('lsp-zero')

local lsp_attach = function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  sign_text = true,
})

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

---- Setup cmp & luasnip
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = { { name = 'nvim_lsp' }, { name = 'luasnip' } },
  mapping = cmp.mapping.preset.insert({
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  }
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
