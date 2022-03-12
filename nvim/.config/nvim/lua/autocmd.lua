-- Autoformat lua files
vim.cmd 'autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)'

-- Autoformat tsx files
vim.cmd 'autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)'

-- Autoformat jsx files
vim.cmd 'autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)'
