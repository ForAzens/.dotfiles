return {
  -- Lazy
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function(_, _)
    vim.cmd('colorscheme onedark_vivid')
  end
}
