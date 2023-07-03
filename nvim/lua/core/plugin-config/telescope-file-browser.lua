-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
    "n",
    "<space>tn",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)
