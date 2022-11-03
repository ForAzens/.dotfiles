local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').sumneko_lua.setup({ capabilities = capabilities })
