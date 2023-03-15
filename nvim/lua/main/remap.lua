vim.g.mapleader = " "

local map = require("utils").map

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

map("n", "<leader>s", ":so<CR>")  -- Sources your config
map("n", "<leader>r", ":noh<CR>") -- Removes highlights

map("n", "<leader>wn", ":w<CR>")  -- Write normally
map("n", "<leader>we", ":wq<CR>") -- Write and exit
map("n", "<leader>q", ":q<CR>")   -- Quit


-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- When highlighting text, move the selection with J or K
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z") -- When joining lines, keep the cursor where it is

-- Keep the cursor center when jumping half a page
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search terms center
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- When pasting over a highlight, keep your previous paste buffer
map("x", "<leader>p", "\"_dP")

-- Yank into system clipboard : by asbjornHaland
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- Delete to void register
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- Quick fix list
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word that you are on globally
map("n", "<leader>;", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Add execute privileges to the current file
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
