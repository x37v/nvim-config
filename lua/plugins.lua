return {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  'neovim/nvim-lspconfig',
  'simrat39/rust-tools.nvim',

  'nvim-lua/lsp-status.nvim',

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
          git_ignored = false
        }
      })
    end,
  },

  'tpope/vim-fugitive',

  {
    'nvim-telescope/telescope.nvim', version = '0.1.6',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },

  'gpanders/editorconfig.nvim',

  'jlanzarotta/bufexplorer',

  'lukas-reineke/lsp-format.nvim',


  -- Completion framework:
  'hrsh7th/nvim-cmp',

  -- LSP completion source:
  'hrsh7th/cmp-nvim-lsp',

  -- Useful completion sources:
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/vim-vsnip',

  -- debugging
  'mfussenegger/nvim-dap',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },


  -- color schemes
  'folke/tokyonight.nvim',

  -- commenting
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- formatting
  'mhartington/formatter.nvim',
}
