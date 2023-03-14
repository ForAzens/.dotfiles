return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" }
    }
  },

  -- {
  --   'sindrets/diffview.nvim',
  --   cmd = "DiffviewOpen",
  --   keys = {
  --     { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff" }
  --   }
  -- },

  {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
      })
    end
  }
}
