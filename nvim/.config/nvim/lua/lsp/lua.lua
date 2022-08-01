local coq = require('coq')
require('lspconfig').sumneko_lua.setup(coq.lsp_ensure_capabilities({}))
