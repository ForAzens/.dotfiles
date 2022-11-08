local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.buf_map(mode, lhs, rhs, buffer, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

function utils.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

-- Require which returns nil if module does not exist
function utils.prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  -- Failed to load
  return nil
end

return utils
