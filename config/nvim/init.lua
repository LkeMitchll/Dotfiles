-- General Config
vim.g.mapleader = " "
vim.opt.clipboard = "unnamed"
vim.opt.scrolloff = 999
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.relativenumber = true

-- Plugins
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.basics").setup({ options = { extra_ui = true } })
      vim.opt.listchars:append({ space = "·" })
      local mini_plugins = {
        "ai", "comment", "jump", "jump2d", "move", "bracketed",
        "pairs", "statusline", "splitjoin", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_plugins) do
        require("mini." .. plugin).setup({})
      end
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        highlight = { enable = true },
      })
      vim.filetype.add({
        extension = { njk = "nunjucks" },
        filename = { [".njk"] = "htmldjango" }
      })
      vim.treesitter.language.register("htmldjango", "nunjucks")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = { defaults = { winblend = 10 } },
    keys = {
      { "<C-T>",   ":Telescope find_files<CR>" },
      { "<C-S-T>", ":Telescope find_files hidden=true<CR>" },
      { "<C-A>",   ":Telescope live_grep<CR>" }
    }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local lsp = require("lsp-zero").preset({})
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
      require("lspconfig").html.setup({ filetypes = { "html", "nunjucks" } })
      require("lspconfig").emmet_ls.setup({ filetypes = { "html", "nunjucks", "css", "scss" } })
      require("lspconfig").stylelint_lsp.setup({ filetypes = { "css", "scss" } })
      lsp.setup()
      vim.keymap.set("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", {})
    end
  },
  { "TimUntersberger/neogit",        config = true, keys = { { "<C-G>", ":Neogit kind=split<CR>" } } },
  { "stevearc/oil.nvim",             config = true, keys = { { "-", ":split<CR>:Oil<CR>" } } },
  { "knubie/vim-kitty-navigator",    lazy = false,  build = "cp ./*.py ~/.config/kitty/" },
  { "lkemitchll/kitty-runner.nvim",  config = true },
  { "andrewferrier/debugprint.nvim", config = true }
}, { dev = { path = "~/Developer" } })
