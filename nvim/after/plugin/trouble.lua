local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>l", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Toggle trouble"})