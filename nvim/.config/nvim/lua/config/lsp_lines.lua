require("lsp_lines").setup()

-- Show warnings only in current line
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
