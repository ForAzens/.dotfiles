local luaformat = require 'lsp.formatters.lua-format'

local prettier = require 'lsp.formatters.prettier_d'
local eslint_d = require 'lsp.linters.eslint_d'

local languages = {
  json = { prettier },
  typescript = { prettier, eslint_d },
  javascript = { prettier, eslint_d },
  typescriptreact = { prettier, eslint_d },
  ['typescript.tsx'] = { prettier, eslint_d },
  javascriptreact = { prettier, eslint_d },
  ['javascript.jsx'] = { prettier, eslint_d },
  yaml = { prettier },
  css = { prettier, eslint_d }
}

require 'lspconfig'.efm.setup {
  init_options = { documentFormatting = true },
  filetypes = vim.tbl_keys(languages),
  settings = { rootMarkers = { ".git/", "package.json" }, languages = languages }
}
