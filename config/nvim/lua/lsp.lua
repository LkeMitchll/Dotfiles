local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {"documentation", "detail", "additionalTextEdits"}
}

-- LSP servers
configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {"html", "eruby", "css", "scss"},
    root_dir = require "lspconfig".util.root_pattern(".git", vim.fn.getcwd())
  }
}

lspconfig.emmet_ls.setup {on_attach = on_attach}
lspconfig.cssls.setup {}
lspconfig.tsserver.setup {}
lspconfig.html.setup {filetypes = {"html", "eruby"}}

-- Linting & formatting
local nodePrefix = "./node_modules/.bin/"

function prettier(parser)
  return {
    formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath --parser=" .. parser,
    formatStdin = true
  }
end
local stylelint = {
  lintCommand = nodePrefix .. "stylelint --formatter unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = false,
  lintFormats = {"%f:%l:%c: %m [%t%*[a-z]]"}
}
local eslint = {
  lintCommand = nodePrefix .. "eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = true
}
local rubocop = {
  lintCommand = "bundle exec rubocop --format emacs --force-exclusion --stdin ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = true
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"css", "html", "javascript", "lua", "ruby", "scss"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      css = {prettier("css"), stylelint},
      html = {prettier("html")},
      javascript = {prettier("babel"), eslint},
      lua = {{formatCommand = "luafmt -i 2"}},
      ruby = {rubocop},
      scss = {prettier("scss"), stylelint}
    }
  }
}
