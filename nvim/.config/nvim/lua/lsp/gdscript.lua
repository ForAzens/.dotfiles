local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.gdscript.setup(
  {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
)
