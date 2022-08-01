vim.g.coq_settings = {
  auto_start = 'shut-up',
  clients = {
    tmux = { enabled = false },
    lsp = {
      resolve_timeout = 0.15
    }
  },
  display = {
    icons = {
      mappings = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      }
    }
  }
}

require 'coq'
require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" }
}
