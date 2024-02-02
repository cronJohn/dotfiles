local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "Toggle Undotree"})
