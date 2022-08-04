local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.gdscript.setup(
  {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
)
