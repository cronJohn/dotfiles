local map = require("keytex.keybindings").create_keybinding

map("n", "<leader>nt", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Open telescope file browser" })
