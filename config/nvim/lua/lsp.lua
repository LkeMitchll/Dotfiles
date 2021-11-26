local lspconfig = require("lspconfig")

on_attach = function(client)
  -- Always use the first formatter
  client.resolved_capabilities.document_formatting = false
  -- Plugin: coq_nvim
  require("coq")().lsp_ensure_capabilities()
end

-- Init servers
local servers = { "cssls", "html", "stylelint_lsp", "tsserver", "eslint", "tailwindcss" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
  })
end

-- Plugin: null_ls (linting & formatting)
require("lsp.htmlbeautifier")

local null_ls = require("null-ls")
local nl_builtin = null_ls.builtins

null_ls.config({
  sources = {
    nl_builtin.formatting.prettier,
    nl_builtin.formatting.stylua,
    htmlbeautifier,
  },
})

lspconfig["null-ls"].setup({ on_attach = on_attach })
