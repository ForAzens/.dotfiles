return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'jose-elias-alvarez/typescript.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function(_, _)
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.ensure_installed({
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer'
      })

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
            ['C-p'] = cmp.mapping.select_prev_item(cmp_select),
            ['C-n'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
            ['C-Space'] = cmp.mapping.complete(),
      })

      -- Config copilot
      local cmp_sources = lsp.defaults.cmp_sources()
      table.insert(cmp_sources, { name = "copilot", group_index = 2 })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
        sources = cmp_sources
      })

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end


      lsp.on_attach(on_attach)

      lsp.skip_server_setup({ "tsserver" })
      require("typescript").setup({
        server = {
          on_attach = on_attach,
        }
      }
      )


      lsp.nvim_workspace()

      lsp.setup()
    end,
  },

  -- null-ls
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- Prettier
          null_ls.builtins.formatting.prettier.with({
            env = { PRETTIERD_LOCAL_PRETTIER_ONLY = 1 }
          }),

          -- Lua
          null_ls.builtins.formatting.lua_format,

        }
      }
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },

}
