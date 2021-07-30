local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {"documentation", "detail", "additionalTextEdits"}
}
on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
end

-- Hide inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    underline = true,
    signs = true
  }
)
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

-- LSP servers
configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {"html", "eruby", "css", "scss"},
    root_dir = require "lspconfig".util.root_pattern(".git", vim.fn.getcwd()),
    settings = {}
  }
}

lspconfig.cssls.setup {on_attach = on_attach}
lspconfig.emmet_ls.setup {capabilities = capabilities, on_attach = on_attach}
lspconfig.html.setup {on_attach = on_attach, filetypes = {"html", "eruby"}}
lspconfig.stylelint_lsp.setup {on_attach = on_attach}
lspconfig.tsserver.setup {on_attach = on_attach}

-- Linting & formatting
local nodePrefix = "./node_modules/.bin/"

function prettier(parser)
  return {
    formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath --parser=" .. parser,
    formatStdin = true
  }
end
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
  filetypes = {"css", "html", "javascript", "lua", "ruby", "scss", "json"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      css = {prettier("css")},
      html = {prettier("html")},
      javascript = {prettier("babel"), eslint},
      lua = {{formatCommand = "luafmt -i 2"}},
      ruby = {rubocop},
      scss = {prettier("scss")},
      json = {prettier("json")}
    }
  }
}
