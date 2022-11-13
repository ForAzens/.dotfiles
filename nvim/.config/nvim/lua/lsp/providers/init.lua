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

  return function() setup_func(opts) end
end

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  ["tsserver"] = create_handler("tsserver", function(...)
    require("typescript").setup({
      go_to_source_definition = { fallback = true },
      server = ...
    })
  end),
  ["rust_analyzer"] = create_handler("rust_analyzer",
    require("rust-tools").setup),
  ["sumneko_lua"] = create_handler("sumneko_lua"),
  ["solargraph"] = create_handler("solargraph"),
  ["cssls"] = create_handler("cssls"),
  ["astro"] = create_handler("astro"),
  ["tailwindcss"] = create_handler("tailwindcss"),
  ["jsonls"] = create_handler("jsonls"),
  ["html"] = create_handler("html"),
  ["yamlls"] = create_handler("yamlls"),
  ["dockerls"] = create_handler("dockerls"),
  ["bashls"] = create_handler("bashls"),
  ["vimls"] = create_handler("vimls"),
  ["pyright"] = create_handler("pyright"),
  ["terraformls"] = create_handler("terraformls"),
  ["gopls"] = create_handler("gopls"),
  ["denols"] = create_handler("denols"),
  ["cmake"] = create_handler("cmake"),
  ["clangd"] = create_handler("clangd"),
  ["elixirls"] = create_handler("elixirls"),
  ["erlangls"] = create_handler("erlangls"),
  ["hls"] = create_handler("hls"),
  ["jdtls"] = create_handler("jdtls"),
  ["kotlin_language_server"] = create_handler("kotlin_language_server"),
  ["svelte"] = create_handler("svelte"),
  ["texlab"] = create_handler("texlab"),
  ["vimls"] = create_handler("vimls"),
  ["vuels"] = create_handler("vuels"),
}

local gdscript_handler = create_handler("gdscript")
gdscript_handler()


-- null-ls is not a lsp server, it needs to be outside the previous table
local null_ls = require("null-ls")
local create_null_ls_handler = create_handler("null-ls", null_ls.setup)
create_null_ls_handler()
