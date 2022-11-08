local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  require('lsp.mappings').init(client, bufnr)
end

require('lspconfig').sumneko_lua.setup({ capabilities = capabilities, on_attach = on_attach })
