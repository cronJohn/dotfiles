return {

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
  },

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-treesitter/playground',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',

  -- LSP
  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  'neovim/nvim-lspconfig',
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Autocompletion
		  'hrsh7th/nvim-cmp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'saadparwaiz1/cmp_luasnip',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-nvim-lua',

		  -- Snippets
		  'L3MON4D3/LuaSnip',
		  'rafamadriz/friendly-snippets',
  	},
  },

  -- Theme
  'navarasu/onedark.nvim',
}
