local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  require('lsp.mappings').init(client, bufnr)
end

require('rust-tools').setup({ capabilities = capabilities, on_attach = on_attach })
