-- General Config
vim.g.mapleader = " "
vim.opt.clipboard = "unnamed"
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars:append({ space = "·" })
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Keymaps
vim.keymap.set("n", "<S-C-J>", ":cnext<CR>", {})
vim.keymap.set("n", "<S-C-K>", ":cprevious<CR>", {})

-- Plugins
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup {
  { "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({})
      vim.cmd.colorscheme("tokyonight-night")
    end
  },
  { "echasnovski/mini.nvim",
    config = function()
      local mini_plugins = {
        "ai", "comment", "jump", "jump2d", "move", "pairs",
        "statusline", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_plugins) do
        require("mini." .. plugin).setup({})
      end
    end
  },
  { "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "glench/vim-jinja2-syntax",
      "fladson/vim-kitty"
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end
  },
  { "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<C-t>", ":Telescope find_files<CR>" },
      { "<C-S-t>", ":Telescope find_files hidden=true<CR>" },
      { "<leader>a", ":Telescope live_grep<CR>" }
    }
  },
  { "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    event = "BufEnter",
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.configure("html", { filetypes = { "html", "jinja.html", "eruby" } })
      lsp.configure("emmet_ls", { filetypes = { "html", "jinja.html", "eruby", "css", "scss" } })
      lsp.configure("stylelint_lsp", { filetypes = { "css", "scss" } })
      lsp.nvim_workspace()
      lsp.setup()
      vim.keymap.set("n", "<leader>p", ":LspZeroFormat<CR>", {})
    end
  },
  { "TimUntersberger/neogit",
    config = true,
    keys = {
      { "<leader>gs", ":Neogit kind=split<CR>" }
    }
  },
  { "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" },
  { "lkemitchll/kitty-runner.nvim", config = true },
  { "andrewferrier/debugprint.nvim", config = true }
}
