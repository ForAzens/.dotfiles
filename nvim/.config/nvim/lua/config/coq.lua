vim.g.coq_settings = {
  auto_start = 'shut-up',
  clients = {
    tmux = { enabled = false },
  },
}

require 'coq'
require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" }
}
