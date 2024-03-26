require('keytex.keybindings').setup()

local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>o", require('keytex.finder').keybinding_picker, {desc="Search keybindings"})
