local utils = require('utils')
local cmd = vim.cmd

vim.o.termguicolors = true

-- vim.g.neon_style = "dark"
-- vim.g.neon_italic_keyword = true
-- vim.g.neon_italic_function = true
-- vim.g.neon_transparent = true

vim.g.tokyonight_style = "night"

cmd 'colorscheme tokyonight'
