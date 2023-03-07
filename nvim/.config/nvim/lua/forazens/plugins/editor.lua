return {

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "0.1.1",
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>",                desc = "Find files" },
      -- find
      { "<leader>fF",      "<cmd>Telescope find_files<cr>",                desc = "Find files" },
      { "<leader>ff",      "<cmd>Telescope find_files<cr>",                desc = "Find files (Git)" },
      { "<leader>fs",      "<cmd>Telescope live_grep<cr>",                 desc = "Search in project" },
      { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
      { "<leader>fr",      "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },

      -- git
      { "<leader>gc",      "<cmd>Telescope git_commits<cr>",               desc = "commits" },

      --search
      { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in current buffer" },
      { "<leader>sg",      "<cmd>Telescope live_grep<cr>",                 desc = "Grep in CWD" },
      { "<leader>sd",      "<cmd>Telescope diagnostics<cr>",               desc = "Diagnotics" },
      { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                 desc = "Help pages" },
      { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
      { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
      { "<leader>sR",      "<cmd>Telescope resume<cr>",                    desc = "Resume" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
                ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
                ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
          }
        }
      }
    }
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        -- ["g"] = { name = "+goto" },
        -- ["gz"] = { name = "+surround" },
        -- ["]"] = { name = "+next" },
        -- ["["] = { name = "+prev" },
        -- ["<leader><tab>"] = { name = "+tabs" },
        -- ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
        -- ["<leader>gh"] = { name = "+hunks" },
        -- ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
        -- ["<leader>w"] = { name = "+windows" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
      }
      wk.register(keymaps)
    end,
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
  },

}
