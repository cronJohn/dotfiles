local options = {
    number = true,
    relativenumber = true,
    numberwidth = 1,                          -- set number column width

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    breakindent = true,

    wrap = false,

    swapfile = false,
    backup = false,

    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    hlsearch = true,
    incsearch = true,

    termguicolors = true,
    showmode = false,
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages

    ignorecase = true,                       -- ignore case in search patterns
    smartcase = true,                        -- if it contains uppercase, then respect case

    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height

    signcolumn = "yes:3",

    scrolloff = 8,                           -- How many lines to keep above and below the cursor

    -- Decrease update time
    updatetime = 250,
    timeoutlen = 300,

    -- Show spaces and other whitespace characters
    list = true,
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },

    inccommand = 'split',                   -- Preview substitutions live

}

for k, v in pairs(options) do
   vim.opt[k] = v
end
