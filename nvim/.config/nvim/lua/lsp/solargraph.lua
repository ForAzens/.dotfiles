local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  require('lsp.mappings').init(client, bufnr)

end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.solargraph.setup({ on_attach = on_attach, capabilities = capabilities })
