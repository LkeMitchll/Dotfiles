local set_option = vim.api.nvim_set_option
local set_keymap = vim.api.nvim_set_keymap
local command = vim.cmd

vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.list = true
set_option("clipboard", "unnamed")
set_option("cursorline", true)
set_option("listchars", "eol:¬,space:·,trail:")
set_option("splitbelow", true)
set_option("smartindent", true)
set_option("expandtab", true)
set_option("shiftround", true)
set_option("softtabstop", 2)
set_option("tabstop", 2)
set_option("shiftwidth", 2)
set_option("completeopt", "menuone,noselect")
set_option("updatetime", 500)
command("set title")

require("packer").startup(function()
    use "wbthomason/packer.nvim"
    --
    use "b3nj5m1n/kommentary"
    use "folke/tokyonight.nvim"
    use "ggandor/lightspeed.nvim"
    use "hoob3rt/lualine.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "knubie/vim-kitty-navigator"
    use "lkemitchll/vim-kitty-runner"
    use "neovim/nvim-lspconfig"
    use "tpope/vim-surround"
    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function() require("gitsigns").setup() end
    }
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        run = ":COQdeps",
        requires = {{'ms-jpq/coq.artifacts', branch = "artifacts"}}
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate"
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}
    }
    use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
end)

-- Keymaps
set_keymap("n", "<C-]>", ":cnext<CR>", {})
set_keymap("n", "<C-[>", ":cprevious<CR>", {})

-- Plugin: tokyonight.nvim
vim.g.tokyonight_style = "night"
command "colorscheme tokyonight"

-- Plugin: lualine.nvim
require("lualine").setup {options = {theme = "tokyonight"}}

-- Plugin: nvim-treesitter
local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
    ensure_installed = "maintained",
    highlight = {enable = true},
    indent = {enable = true}
}

-- Plugin: nvim-lspconfig
require("lsp")

set_keymap("n", "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", {})
set_keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting()<CR>", {})

-- Plugin: nvim-kitty-runner
vim.g.KittySwitchFocus = 1
vim.g.KittyFocusLayout = "tall:bias=60"

-- Plugin: neogit
require("neogit").setup {}
set_keymap("n", "<leader>gs", ":Neogit kind=split<CR>", {})

-- Plugin: telescope.nvim
local tsactions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                -- Open quickfix with tagged files
                ["<C-z>"] = tsactions.send_selected_to_qflist +
                    tsactions.open_qflist
            }
        }
    }
}

set_keymap("n", "<C-t>", ":Telescope find_files<CR>", {})
set_keymap("n", "<leader>ag", ":Telescope live_grep<CR>", {})
set_keymap("n", "<leader>b", ":Telescope oldfiles<CR>", {})
set_keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>", {})
set_keymap("n", "<leader>d", ":Telescope lsp_document_diagnostics<CR>", {})
set_keymap("n", "<leader>v", ":Telescope commands<CR>", {})

-- Plugin: coq_nvim
vim.g.coq_settings = {auto_start = "shut-up", keymap = {jump_to_mark = "<C-g>"}}
