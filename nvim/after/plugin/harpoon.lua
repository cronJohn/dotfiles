local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ni", mark.add_file)
vim.keymap.set("n", "<leader>ne", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>nt", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>ns", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>nr", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>na", function() ui.nav_file(4) end)
