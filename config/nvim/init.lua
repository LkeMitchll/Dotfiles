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

local statusline = "%#PmenuSel#"
statusline = statusline .. " %f "
statusline = statusline .. "%#Statusline#"
option.statusline = statusline

-- Plugins
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  --
  use({
    "folke/tokyonight.nvim",
    config = function()
      global.tokyonight_style = "night"
      global.tokyonight_colors = { border = "bg_highlight" }
      command("colorscheme tokyonight")
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
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      local on_attach = function(client)
        if client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
        end

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
      local nls = require("null-ls")
      nls.setup({
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
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
        ensure_installed = {
          "css",
          "fish",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "ruby",
          "scss",
          "svelte",
          "typescript",
          "tsx",
          "vim",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
      -- augroup: file type detections
      vim.api.nvim_create_augroup("filedetect", { clear = true })

      -- autocmd: Enable spell checking for certain file types
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = "filedetect",
        pattern = { "*.njk" },
        command = "set filetype=jinja.html",
      })
    end,
    requires = { "glench/vim-jinja2-syntax" },
  })
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          mappings = {
            i = {
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
      })
    end,
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
set_keymap("n", "<leader>e", ":Hexplore<CR>", {})
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})
---- LSP
set_keymap("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", ":lua vim.lsp.buf.format { async = true }<CR>", {})
---- neogit
set_keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})
---- Telescope
set_keymap("n", "<C-t>", ":Telescope find_files hidden=true<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>", {})
set_keymap("n", "<leader>d", ":Telescope diagnostics bufnr=0<CR>", {})
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})
