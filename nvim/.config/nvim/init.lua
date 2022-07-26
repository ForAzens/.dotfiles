-- Map leader to space
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command


-- Sensible defaults
require('settings')

-- vim.lsp.set_log_level("TRACE")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
    install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

vim.g.coq_settings = {
  auto_start = true,
  clients = {
    tmux = { enabled = false },
  },
}

-- Install plugins
require('plugins')

-- Config
---@diagnostic disable-next-line: different-requires
require('config')

-- LSP
require('lsp/config')
require('lsp/ts_server')
require('lsp/css')
require('lsp/efm')
require('lsp/solargraph')
require('lsp/rust')
require('lsp/gdscript')
-- require('lsp_lua')
require('lsp/lspinstall')


-- Autocmds
require('autocmd')

-- Key mappings
require('keymappings')
