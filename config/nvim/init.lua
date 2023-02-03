-- General Config
vim.g.mapleader = " "
vim.opt.listchars:append({ space = "·" })
vim.opt.clipboard = "unnamed"
vim.opt.scrolloff = 999
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Keymaps
vim.keymap.set("n", "<S-C-J>", ":cnext<CR>", {})
vim.keymap.set("n", "<S-C-K>", ":cprevious<CR>", {})

-- Plugins
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup({
  { "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end
  },
  { "echasnovski/mini.nvim",
    config = function()
      require("mini.basics").setup({ options = { extra_ui = true } })
      local mini_plugins = {
        "ai", "comment", "jump", "jump2d", "move",
        "pairs", "statusline", "surround", "trailspace"
      }
      for _, plugin in ipairs(mini_plugins) do
        require("mini." .. plugin).setup({})
      end
    end
  },
  { "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        highlight = { enable = true },
      })
    end,
  },
  { "fladson/vim-kitty", ft = "kitty" },
  { "glench/vim-jinja2-syntax", ft = "jinja.html" },
  { "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = { defaults = { winblend = 10 } },
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
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.nvim_workspace()
      lsp.configure("html", { filetypes = { "html", "jinja.html" } })
      lsp.configure("emmet_ls", { filetypes = { "html", "jinja.html", "css", "scss" } })
      lsp.configure("stylelint_lsp", { filetypes = { "css", "scss" } })
      lsp.setup()
      vim.keymap.set("n", "<leader>p", ":LspZeroFormat<CR>", {})
    end
  },
  { "TimUntersberger/neogit",
    config = true,
    keys = { { "<leader>gs", ":Neogit kind=split<CR>" } }
  },
  { "stevearc/oil.nvim",
    opts = { float = { max_width = 70, max_height = 20 } },
    keys = { { "-", ":Oil --float<CR>" } }
  },
  { "jghauser/kitty-runner.nvim",
    dev = true,
    config = true,
  },
  { "knubie/vim-kitty-navigator", lazy = false, build = "cp ./*.py ~/.config/kitty/" },
  { "andrewferrier/debugprint.nvim", config = true }
}, { dev = { path = "~/Developer" } })
