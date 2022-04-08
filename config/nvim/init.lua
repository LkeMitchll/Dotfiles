global = vim.g
command = vim.cmd
option = vim.opt
set_keymap = vim.api.nvim_set_keymap

-- General Config
global.mapleader = " "
option.clipboard = "unnamed"
option.relativenumber = true
option.list, option.listchars = true, {
  space = "·",
  trail = "~",
  eol = "¬",
}
option.cursorline = true
option.splitbelow = true
option.smartindent = true
option.expandtab = true
option.shiftround = true
option.shiftwidth = 2
option.completeopt = { "menuone", "noselect" }
option.laststatus = 3
option.scrolloff = 999

-- Plugins
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  --
  use({
    "folke/tokyonight.nvim",
    config = function()
      global.tokyonight_style = "night"
      command("colorscheme tokyonight")
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          theme = "tokyonight",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  })
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    run = ":COQdeps",
    requires = { { "ms-jpq/coq.artifacts", branch = "artifacts" } },
    config = function()
      global.coq_settings = {
        auto_start = "shut-up",
        keymap = { jump_to_mark = "<C-e>" },
      }
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "cssls", "html", "stylelint_lsp", "tsserver", "eslint" }

      on_attach = function(client)
        -- Always use the first formatter
        client.resolved_capabilities.document_formatting = false
        -- Plugin: coq_nvim
        require("coq")().lsp_ensure_capabilities()
      end

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
        })
      end
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.prettier,
          require("null-ls").builtins.formatting.stylua,
        },
      })
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = "maintained",
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim" },
  })
  use({
    "TimUntersberger/neogit",
    config = function()
      require("neogit").setup({})
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
  use("ggandor/lightspeed.nvim")
  use("lkemitchll/vim-kitty-runner")
  use("tpope/vim-surround")
end)

-- Keymaps
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})
---- LSP
set_keymap("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting()<CR>", {})
---- neogit
set_keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})
---- Telescope
set_keymap("n", "<C-t>", ":Telescope find_files hidden=true<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>", {})
set_keymap("n", "<leader>d", ":Telescope diagnostics bufnr=0<CR>", {})
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})
