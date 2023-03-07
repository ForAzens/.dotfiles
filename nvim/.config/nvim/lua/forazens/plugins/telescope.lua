return {
  { "nvim-telescope/telescope.nvim", cmd = "Telescope", version = "0.1.1", keys = {
    { "<leader>fF", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (Git)" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search in project" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "commits" },
  } }
}
