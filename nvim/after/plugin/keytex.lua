require('keytex').setup({
    save_file = "~/.config/nvim-persist"
})

local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>o", require('keytex.finder').keybinding_picker, {desc="Search keybindings"})
