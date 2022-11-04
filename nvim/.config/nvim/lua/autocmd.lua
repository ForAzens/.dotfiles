-- Autoformat lua files
vim.cmd 'autocmd BufWritePre *.lua lua vim.lsp.buf.format {async = true}'

-- Autoformat tsx files
vim.cmd 'autocmd BufWritePre *.tsx lua vim.lsp.buf.format {async = true}'

-- Autoformat jsx files
vim.cmd 'autocmd BufWritePre *.jsx lua vim.lsp.buf.format {async = true}'
