-- General Config
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 200
vim.opt.listchars:append({ space = "·" })

-- Plugins
local plugins = {
  {
    "folke/tokyonight.nvim",
    config = function() vim.cmd.colorscheme("tokyonight-moon") end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      highlight = { enable = true }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.filetype.add({ extension = { njk = "htmldjango" } })
    end
  },
  {
    "echasnovski/mini.nvim",
    init = function()
      require("mini.basics").setup({ options = { extra_ui = true } })

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
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-T>",   ":Telescope find_files<CR>" },
      { "<C-S-T>", ":Telescope find_files hidden=true<CR>" },
      { "<C-A>",   ":Telescope live_grep<CR>" }
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "dev-v3",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local lsp = require("lsp-zero").preset({})

      lsp.on_attach(function()
        lsp.default_keymaps({ preserve_mappings = false })
      end)
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
      lsp.extend_cmp()

      require("mason").setup()
      require("mason-lspconfig").setup({ handlers = { lsp.default_setup } })
    end
  },
  {
    "NeogitOrg/neogit",
    opts = { use_telescope = true },
    keys = { { "<C-G>", ":Neogit kind=split<CR>" } }
  },
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/"
  },
  { "lkemitchll/kitty-runner.nvim", dev = true,   config = true },
  { "folke/which-key.nvim",         config = true }
}

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup(plugins, { dev = { path = "~/Developer" } })
