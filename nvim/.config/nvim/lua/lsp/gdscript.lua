local lsp = require("lspconfig")
local coq = require('coq')

lsp.gdscript.setup(coq.lsp_ensure_capabilities(
  {
    flags = {
      debounce_text_changes = 150,
    }
  }
))
