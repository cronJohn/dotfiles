local map = require("keytex.keybindings").create_keybinding

require('Comment').setup({
    -- NORMAL
    toggler = {
        line = 'gen',
        block = 'gin',
    },

    -- VISUAL
    opleader = {
        line = 'gn',
        block = 'ge',
    },

    extra = {
        above = 'gon',
        below = 'goe',
        eol = 'gea',
    },
})

-- Make keybindings known to keytex
map("n", "gen", "", {desc = "Comment current line"}, {mark = true})
map("n", "gin", "", {desc = "Block comment current line"}, {mark = true})

map("v", "gn", "", {desc = "Comment visual selection"}, {mark = true})
map("v", "ge", "", {desc = "Block comment visual selection"}, {mark = true})

map("n", "gon", "", {desc = "Comment above and enter insert mode"}, {mark = true})
map("n", "goe", "", {desc = "Comment below and enter insert mode"}, {mark = true})
map("n", "gea", "", {desc = "Comment eol and enter insert mode"}, {mark = true})
