-- General Config
vim.g.mapleader = " "
vim.opt.clipboard = "unnamed"
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

-- Plugins
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end
  },
  {
    "echasnovski/mini.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()
      require("mini.basics").setup({ options = { extra_ui = true } })
      vim.opt.listchars:append({ space = "·" })

      local mini_modules = {
        "ai", "bracketed", "comment", "jump", "jump2d", "move",
        "pairs", "splitjoin", "statusline", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_modules) do
        require("mini." .. plugin).setup({})
      end
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = { enable = true },
      })
      vim.filetype.add({
        extension = { njk = "htmldjango" },
        filename = { [".njk"] = "htmldjango" }
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<C-T>",   ":Telescope find_files<CR>" },
      { "<C-S-T>", ":Telescope find_files hidden=true<CR>" },
      { "<C-A>",   ":Telescope live_grep<CR>" },
      { "-",       ":Telescope file_browser path=%:p:h<CR>" }
    },
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
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    init = function()
      local lsp = require("lsp-zero").preset("recommended")
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
      require("luasnip.loaders.from_vscode").lazy_load()
      lsp.setup()
    end
  },
  {
    "TimUntersberger/neogit",
    config = true,
    keys = { { "<C-G>", ":Neogit kind=split<CR>", desc = "Open Neogit" } }
  },
  {
    "andrewferrier/debugprint.nvim",
    config = true,
    keys = { { "g?v" } }
  },
  {
    "lkemitchll/kitty-runner.nvim",
    config = true
  },
  {
    "folke/which-key.nvim",
    config = true
  },
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/"
  }
}, { dev = { path = "~/Developer" } })
