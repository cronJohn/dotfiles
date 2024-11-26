vim.g.mapleader = " "

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require("core.keymaps")
require("core.plugins")
require("core.globals")
require("core.shortcuts")
require("core.autoinstall")

-- Load language specific configs
require("languages.rust")