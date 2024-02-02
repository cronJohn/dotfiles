local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>na", mark.add_file, {desc = "Harpoon add file"})
map("n", "<leader>ns", ":Telescope harpoon marks<CR>", {desc = "Harpoon view marks"})

map("n", "<C-n>", function() ui.nav_file(1) end, {desc = "Harpoon nav to file 1"})
map("n", "<C-e>", function() ui.nav_file(2) end, {desc = "Harpoon nav to file 2"})
map("n", "<C-i>", function() ui.nav_file(3) end, {desc = "Harpoon nav to file 3"})
map("n", "<C-o>", function() ui.nav_file(4) end, {desc = "Harpoon nav to file 4"})
