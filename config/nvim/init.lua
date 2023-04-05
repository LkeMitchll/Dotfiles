-- General Config
vim.g.mapleader = " "
vim.opt.clipboard = "unnamed"
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 0

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
    init = function()
      vim.opt.listchars:append({ space = "·" })
      require("mini.basics").setup({ options = { extra_ui = true } })
      local mini_plugins = {
        "ai", "bracketed", "comment", "jump", "jump2d", "move", "pairs",
        "splitjoin", "statusline", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_plugins) do
        require("mini." .. plugin).setup({})
      end
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
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
    keys = {
      { "<C-T>",   ":Telescope find_files<CR>",             desc = "Find files with Telescope" },
      { "<C-S-T>", ":Telescope find_files hidden=true<CR>", desc = "Find hidden files with Telescope" },
      { "<C-A>",   ":Telescope live_grep<CR>",              desc = "Find stings with Telescope" }
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
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    init = function()
      local lsp = require("lsp-zero").preset({})
      local lspconfig = require("lspconfig")
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
      lspconfig.emmet_ls.setup({ filetypes = { "html", "nunjucks", "css", "scss" } })

      lsp.setup()
      vim.keymap.set("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", { desc = "Format with LSP" })
      ---
      require("luasnip.loaders.from_vscode").lazy_load()
      require("cmp").setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" }
        },
        mapping = {
          ["<C-F>"] = require("lsp-zero").cmp_action().luasnip_jump_forward()
        }
      })
    end
  },
  {
    "knubie/vim-kitty-navigator",
    lazy = false,
    build = "cp ./*.py ~/.config/kitty/"
  },
  {
    "TimUntersberger/neogit",
    config = true,
    keys = { { "<C-G>", ":Neogit kind=split<CR>", desc = "Open Neogit" } }
  },
  {
    "stevearc/oil.nvim",
    config = true,
    keys = { { "-", ":Oil --float<CR>", desc = "Open Oil" } }
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
  { "github/copilot.vim" }
}, { dev = { path = "~/Developer" } })
