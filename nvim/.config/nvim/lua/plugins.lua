return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- Color scheme
  -- use {'sainnhe/gruvbox-material'}
  -- use {'tanvirtin/monokai.nvim'}
  -- use {'sainnhe/everforest'}
  -- use {'shaunsingh/nord.nvim'}
  use { 'rafamadriz/neon' }
  use { 'folke/tokyonight.nvim' }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
  use { 'tami5/lspsaga.nvim' }

  use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })

  -- Completion
  -- use { 'hrsh7th/cmp-buffer' }
  -- use { 'hrsh7th/cmp-path' }
  -- use { 'hrsh7th/cmp-calc' }
  -- use { 'hrsh7th/cmp-nvim-lua' }
  -- use { 'hrsh7th/cmp-nvim-lsp' }
  -- -- use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'nvim-cmp'}
  -- use { 'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim' }

  -- Icons in completion
  use { 'onsails/lspkind-nvim' }

  -- Snippets

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }
  -- Surround
  use { 'tpope/vim-surround' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/playground' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Comments
  use { 'numToStr/Comment.nvim', tag = 'v0.7.0' }

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Tmux integration
  use 'christoomey/vim-tmux-navigator'

  -- Git signs
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Indent lines
  use "lukas-reineke/indent-blankline.nvim"

  -- Magit clone
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Hop
  -- use 'ggandor/lightspeed.nvim'
  use {
    'phaazon/hop.nvim',
    tag = 'v2.0.3', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- Better quickfix
  use { 'kevinhwang91/nvim-bqf' }
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }

  -- Autotags
  use { "windwp/nvim-ts-autotag" }

  use 'ThePrimeagen/git-worktree.nvim'

  use 'onsails/diaglist.nvim'

  use 'ThePrimeagen/harpoon'

  -- use 'github/copilot.vim
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  use 'simrat39/rust-tools.nvim'
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'habamax/vim-godot'

  use { 'hrsh7th/nvim-cmp', requires = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'petertriho/cmp-git' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' }
  } }

  use "rafamadriz/friendly-snippets"

end)
