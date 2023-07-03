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
    },
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("harpoon")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nt', builtin.find_files, {})
vim.keymap.set('n', '<leader>ng', builtin.git_files, {})
vim.keymap.set('n', '<leader>ns', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
