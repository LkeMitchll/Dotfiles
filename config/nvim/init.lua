-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 200

-- Plugins
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.cmd.colorscheme("tokyonight-moon")
    end
  },
  {
    "echasnovski/mini.nvim",
    init = function()
      require("mini.basics").setup({ options = { extra_ui = true } })
      vim.opt.listchars:append({ space = "·" })

      local mini_modules = {
        "ai", "bracketed", "comment", "files", "jump", "jump2d", "move",
        "pairs", "splitjoin", "statusline", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_modules) do
        require("mini." .. plugin).setup({})
      end

      vim.keymap.set("n", "-", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = { enable = true }
      })
      vim.filetype.add({ extension = { njk = "htmldjango" } })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<C-T>",   ":Telescope find_files<CR>" },
      { "<C-S-T>", ":Telescope find_files hidden=true<CR>" },
      { "<C-A>",   ":Telescope live_grep<CR>" }
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
    "NeogitOrg/neogit",
    config = true,
    keys = { { "<C-G>", ":Neogit kind=split<CR>" } }
  },
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/"
  },
  { "lkemitchll/kitty-runner.nvim", config = true },
  { "folke/which-key.nvim",         config = true }
})
