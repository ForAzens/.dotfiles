local M = {}

function M.on_attach(client, bufnr)
  require('lsp.mappings').init(client, bufnr)
end

M.flags = {
  debounce_text_changes = 150,
}

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M;
