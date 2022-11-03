local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --

  -- Disable tsserver formatting
  -- client.resolved_capabilities.document_formatting = false

end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.solargraph.setup({ on_attach = on_attach, capabilities = capabilities })
