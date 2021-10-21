local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

-- Hide inline diagnostics (show on hover)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false, underline = true, signs = true }
)
vim.cmd([[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]])
vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])

on_attach = function(client)
  -- Always use the first formatter
  client.resolved_capabilities.document_formatting = false
  -- Plugin: coq_nvim
  require("coq")().lsp_ensure_capabilities()
end

-- Init servers
lspconfig.cssls.setup({ on_attach = on_attach })
lspconfig.html.setup({ on_attach = on_attach, filetypes = { "html", "eruby" } })
lspconfig.stylelint_lsp.setup({ on_attach = on_attach })
lspconfig.tsserver.setup({ on_attach = on_attach })
lspconfig.eslint.setup({ on_attach = on_attach })

-- Plugin: null_ls (linting & formatting)
local htmlbeautifier = {}
local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")

htmlbeautifier.method = methods.FORMATTING
htmlbeautifier.filetypes = { "eruby", "html" }

htmlbeautifier.generator = helpers.formatter_factory({
  command = "htmlbeautifier",
  to_stdin = true,
})

local null_ls = require("null-ls")
local nl_builtin = null_ls.builtins

null_ls.config({
  sources = {
    nl_builtin.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "css",
        "scss",
        "json",
        "yaml",
        "markdown",
      },
    }),
    nl_builtin.formatting.stylua,
    htmlbeautifier,
  },
})

lspconfig["null-ls"].setup({ on_attach = on_attach })
