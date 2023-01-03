-- General Config
local option = vim.opt
vim.g.mapleader = " "
option.clipboard = "unnamed"
option.cursorline = true
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

-- Keymaps
local keymap = vim.keymap.set
keymap("n", "<leader>e", ":Hexplore<CR>", {})
keymap("n", "<S-C-J>", ":cnext<CR>", {})
keymap("n", "<S-C-K>", ":cprevious<CR>", {})

-- Plugin: Tokyonight (colorscheme)
require("tokyonight").setup({
  styles = {
    sidebars = "normal",
    floats = "normal"
  },
  on_colors = function(colors)
    colors.border = colors.bg_highlight
  end,
})
vim.cmd.colorscheme("tokyonight-night")

-- Plugin: Mini
local mini_plugins = {
  "ai", "comment", "jump", "jump2d", "pairs",
  "statusline", "surround", "trailspace"
}
for _, plugin in ipairs(mini_plugins) do
  require("mini." .. plugin).setup({})
end

-- Plugin: nvim-cmp & snippy
local cmp, snippy = require("cmp"), require("snippy")
cmp.setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "buffer" },
  }),
})

-- Plugin: nvim-lspconfig, mason & mason-lspconfig
require("mason").setup()
local mason_lsp, lsp = require("mason-lspconfig"), require('lspconfig')
mason_lsp.setup({
  ensure_installed = {
    "cssls", "html", "jsonls", "eslint",
    "stylelint_lsp", "tsserver", "sumneko_lua"
  },
  automatic_installation = true
})
mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup({})
  end,
  ["stylelint_lsp"] = function()
    lsp.stylelint_lsp.setup({
      filetypes = { "css", "scss" }
    })
  end
}
keymap("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", {})

-- Plugin: Treesitter
require("nvim-treesitter.configs").setup({
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
      vertical = {
        preview_cutoff = 30,
      },
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
keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
keymap("n", "<C-S-t>", ":Telescope find_files hidden=true<CR>", {})
keymap("n", "<leader>a", ":Telescope live_grep<CR>", {})

-- Plugin: Neogit
require("neogit").setup()
keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})

-- Plugin: kitty-runner
require("kitty-runner").setup()
