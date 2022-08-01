local nvim_lsp = require('lspconfig')
local coq = require('coq')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings
    local opts = {noremap = true, silent = true}

    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --

    -- Disable tsserver formatting
    client.resolved_capabilities.document_formatting = false

end

nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
}))
