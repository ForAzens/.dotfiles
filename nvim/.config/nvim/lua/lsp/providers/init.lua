local u = require("utils")
local default_config = require("lsp.providers.defaults")


local function create_handler(client_name, setup_func)
  -- Support for custom setup_functions
  if setup_func == nil then
    setup_func = require("lspconfig")[client_name].setup
  end

  -- Support for custom config
  local opts = default_config
  local client_config = u.prequire("lsp.providers." .. client_name)
  if type(client_config) == "table" then
    opts = u.merge(opts, client_config)
  end

  return function()
    setup_func(opts)
  end
end

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  ["tsserver"] = create_handler("tsserver"),
  ["rust_analyzer"] = create_handler("rust_analyzer", require("rust-tools").setup),
  ["sumneko_lua"] = create_handler("sumneko_lua"),
  ["solargraph"] = create_handler("solargraph"),
  ["cssls"] = create_handler("cssls"),
  -- ["gdscript"] = create_handler("gdscript")
}

-- null-ls is not a lsp server, it needs to be outside the previous table
local null_ls = require("null-ls")
local create_null_ls_handler = create_handler("null-ls", null_ls.setup)
create_null_ls_handler()
