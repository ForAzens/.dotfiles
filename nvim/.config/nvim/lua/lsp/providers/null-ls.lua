local null_ls = require("null-ls")

return {
  sources = {
    -- Eslint
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,

    -- Prettier
    null_ls.builtins.formatting.prettier.with({
      env = { PRETTIERD_LOCAL_PRETTIER_ONLY = 1 }
    }),

    -- Godot
    -- null_ls.builtins.formatting.gdscript_gdformat,
    -- null_ls.builtins.diagnostics.gdscript_godot,

    -- Lua
    null_ls.builtins.formatting.lua_format,

  }
}
