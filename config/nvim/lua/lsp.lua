local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- config
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    underline = true,
    signs = true
  }
)

-- lang servers
lspconfig.cssls.setup {}
lspconfig.tsserver.setup {}
lspconfig.html.setup {filetypes = {"html", "eruby"}}

configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {"html", "css"},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

lspconfig.emmet_ls.setup {capabilities = capabilities}

-- linting & formatting
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

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"lua", "css", "scss", "javascript"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {{formatCommand = "luafmt -i 2"}},
      css = {prettier("css"), stylelint},
      scss = {prettier("scss"), stylelint},
      javascript = {prettier("babel"), eslint}
    }
  }
}
