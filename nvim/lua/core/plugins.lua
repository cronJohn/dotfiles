-- Check if lazy is installed
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

local plugins = {
    -- Appearance
        -- Theme
        {
          "folke/tokyonight.nvim",
          lazy = false,
          priority = 1000,
          opts = {},
        },

        -- Greeter
        {'goolord/alpha-nvim',
         event = "VimEnter",
         dependencies = { 'nvim-tree/nvim-web-devicons' },
        },

        -- Icons
        'nvim-tree/nvim-web-devicons',

        -- Statusline
        'nvim-lualine/lualine.nvim',


    -- Tree-sitter
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'nvim-treesitter/nvim-treesitter-context',

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- CMP
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim", -- Icons

        -- AI
        "github/copilot.vim",


    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- DAP
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    { "folke/neodev.nvim", opts = {} }, -- Type checking, etc. for dap ui

    -- Formatting
     "jose-elias-alvarez/null-ls.nvim",

    -- Productivity
        {"nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }},
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

        "numToStr/Comment.nvim", -- Comment stuff out

        "ahmedkhalf/project.nvim", -- Project management

        {"ggandor/leap.nvim",    -- Jump to any line in a file
        dependencies = { "tpope/vim-repeat" }},

        {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}},

        "theprimeagen/harpoon",
        "tpope/vim-fugitive",    -- Git

        {"folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}},

        "mbbill/undotree",


    -- Languages
        -- Rust
        "simrat39/rust-tools.nvim",

        -- Go
        {
        "Leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
        },

        {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
          require("gopher").setup(opts)
        end,
        build = function()
          vim.cmd [[silent! GoInstallDeps]]
        end,
      },

}

local opts = {}

require("lazy").setup(plugins, opts)
