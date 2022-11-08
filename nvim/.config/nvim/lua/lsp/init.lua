require('lsp/lspinstall')
require('lsp/ts_server')
require('lsp/css')
require('lsp/efm')
require('lsp/solargraph')
require('lsp/rust')
require('lsp/gdscript')
require('lsp/lua')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})
