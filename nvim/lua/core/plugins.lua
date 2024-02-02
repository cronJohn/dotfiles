require('lazy').setup({
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

        -- Comment stuff out
        {
            "numToStr/Comment.nvim",
            lazy = false,
        },

        "ahmedkhalf/project.nvim", -- Project management

        {"ggandor/leap.nvim",    -- Jump to any line in a file
        dependencies = { "tpope/vim-repeat" }},

        {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}},

        "theprimeagen/harpoon",

        -- Git
        "tpope/vim-fugitive",
        "lewis6991/gitsigns.nvim",

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

    -- Personal
    "cronJohn/keytex.nvim",
    {
        dir = "~/Code/Dev/Lua/nvim-dev/keytex.nvim"
    },
},

-- Options
{
    dev = {
        -- directory where you store your local plugin projects
        path = "~/Code/Dev/Lua/nvim-dev",
        fallback = false,
    },

    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "📌",
        },
    },
})
