local map = require("keytex.keybindings").create_keybinding

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

map("n", "<leader>in", ":so<CR>", {desc = "Sources your config"})
map("n", "<leader>ir", ":noh<CR>", {desc = "Removes highlights"})

map("n", "<leader>is", ":w<CR>")
map("n", "<leader>it", ":q<CR>")


-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

map("v", "J", ":m '>+1<CR>gv=gv", {desc = "When highlighting text, move the selection with J"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "When highlighting text, move the selection with K"})

map("n", "J", "mzJ`z", {desc = "When joining lines, keep the cursor where it is"})

map("n", "<C-d>", "<C-d>zz", {desc = "Keep the cursor center when jumping down half a page"})
map("n", "<C-u>", "<C-u>zz", {desc = "Keep the cursor center when jumping up half a page"})

map("n", "n", "nzzzv", {desc = "Keep search terms center when searching forward"})
map("n", "N", "Nzzzv", {desc = "Keep search terms center when searching backward"})


-- Visual --
map("v", "<", "<gv", {desc = "Stay in indent mode when unindenting"})
map("v", ">", ">gv", {desc = "Stay in indent mode when indenting"})

map("x", "<leader>ip", "\"_dP", {desc = "When pasting over a highlight, keep your previous paste buffer"})

-- Yank into system clipboard : by asbjornHaland
map("n", "<leader>y", "\"+y", {desc = "Start a yank into system clipboard"})
map("v", "<leader>y", "\"+y", {desc = "Yank highlighted text into system clipboard"})
map("n", "<leader>Y", "\"+Y", {desc = "Yank current line into system clipboard"})

map("n", "<leader>d", "\"_d", {desc = "Start a deletion into void register"})
map("v", "<leader>d", "\"_d", {desc = "Delete selection into void register"})

-- Quick fix list
map("n", "<C-k>", "<cmd>cnext<CR>zz", {desc = "Go to the next quick fix entry"})
map("n", "<C-j>", "<cmd>cprev<CR>zz", {desc = "Go to the previous quick fix entry"})
map("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "Go to the next location list entry"})
map("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "Go to the previous location list entry"})

map("n", "<leader>;", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "Replace the word that you are on globally"})

map("n", "<leader>ix", "<cmd>!chmod +x %<CR>", {desc = "Add execute privileges to the current file"})

