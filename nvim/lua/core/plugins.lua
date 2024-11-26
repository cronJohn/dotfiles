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
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- for autoinstall
    "neovim/nvim-lspconfig",

    -- CMP
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim", -- Icons

        -- AI
        {
            "supermaven-inc/supermaven-nvim",
            config = function()
                require("supermaven-nvim").setup({})
            end,
        },


    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- DAP
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { "folke/neodev.nvim", opts = {} }, -- Type checking, etc. for dap ui

    -- Formatting
     "nvimtools/none-ls.nvim",

    -- Productivity
        {'nvim-telescope/telescope.nvim',
          event = 'VeryLazy',
          branch = '0.1.x',
          dependencies = {
              'nvim-lua/plenary.nvim',
              {'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
              },
         },
        }, "nvim-telescope/telescope-file-browser.nvim",
           "nvim-telescope/telescope-ui-select.nvim",

        "numToStr/Comment.nvim", -- Comment stuff out

        { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

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
},

-- Options
{
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
