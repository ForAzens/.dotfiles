local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- Colorscheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function(_, opts)

      vim.cmd('colorscheme rose-pine')
    end
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

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
    }
  },

  'jose-elias-alvarez/null-ls.nvim',

  'christoomey/vim-tmux-navigator',

  'echasnovski/mini.ai',
  'echasnovski/mini.nvim',
  'echasnovski/mini.pairs',
  'echasnovski/mini.surround',

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
      config = function ()
        require("copilot_cmp").setup()
      end
    },

    -- use "elihunter173/dirbuf.nvim"
    "stevearc/oil.nvim"
})
