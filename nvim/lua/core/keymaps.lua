local options = {
    number = true,
    relativenumber = true,
    numberwidth = 1,                          -- set number column width

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    smartindent = true,

    wrap = false,

    swapfile = false,
    backup = false,

    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    hlsearch = false,
    incsearch = true,

    termguicolors = true,
    showmode = true,                         -- shows you what mode you are in
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    conceallevel = 0,                        -- so that `` is visible in markdown files
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showtabline = 1,                         -- only show tabline if there are 2 or more tabs
    showcmd = true,                          -- Put last action in bottom right

    signcolumn = "no",

    updatetime = 50,
}

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.opt.isfname:append("@-@")
vim.opt.iskeyword:append("-")                -- will treat this-thing as one word

