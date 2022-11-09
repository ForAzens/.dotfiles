local buf_map = require('utils').buf_map
local M = {}

function M.init(client, bufnr)
  local function set_keymap(mode, lhs, rhs)
    buf_map(mode, lhs, rhs, bufnr)
  end

  set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
  set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
  set_keymap('n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
  set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')

  -- diagnostics
  set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')
  set_keymap('n', '<leader>ge', '<cmd>Telescope diagnostics bufnr=0<cr>')

  -- hover
  set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  -- formatting
  set_keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format {async = true} <cr>')
  set_keymap('v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')

  -- signature help
  -- set_keymap('n', '<C-K>', '<cmd>lua require("lsp_signature").signature()<cr>')

  -- lsp workspace
  set_keymap('n', '<leader>wd', '<cmd>Telescope diagnostics<cr>')
  set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')

  if client.name == 'tsserver' then
    -- typescript helpers
    set_keymap('n', '<leader>gr', ':TypescriptRenameFile<CR>')
    set_keymap('n', '<leader>go', ':TypescriptOrganizeImports<CR>')
    set_keymap('n', '<leader>gi', ':TypescriptAddMissingImports<CR>')
  end
end

return M
