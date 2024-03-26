require("telescope").setup {
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },

        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'harpoon')
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'projects')

local builtin = require('telescope.builtin')
local map = require("keytex.keybindings").create_keybinding

map('n', '<leader>ne', builtin.find_files,        {desc = "Telescope find files"})
map('n', '<leader>nr', builtin.git_files,         {desc = "Telescope git files"})
map('n', '<leader>np', builtin.oldfiles,          {desc = "Telescope old files"})
map('n', '<leader>nd', builtin.diagnostics,       {desc = "Telescope diagnostics"})
map('n', '<leader>nf', builtin.help_tags,         {desc = "Telescope help tags"})
map('n', '<leader>nw', builtin.resume,            {desc = "Telescope resume"})
map('n', '<leader>ni', ":Telescope projects<CR>", {desc = "Telescope search projects"})
map('n', '<leader>ng', builtin.live_grep,         {desc = "Telescope live grep"})
map('n', '<leader>no', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end, {desc = "Telescope grep"})
