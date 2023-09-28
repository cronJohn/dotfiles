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
            -- the default case_mode is "smart_case"
        },
    },
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nt', builtin.find_files, {})
vim.keymap.set('n', '<leader>ng', builtin.git_files, {})
vim.keymap.set('n', '<leader>ns', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
