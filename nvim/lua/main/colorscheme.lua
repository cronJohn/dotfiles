local colorscheme = "onedark"
local themestyle = "darker"

local status_ok, _ = pcall(require, colorscheme)

if not status_ok then
    vim.notify("Color scheme: " .. colorscheme .. " was not found!")
else
    require('onedark').setup {
        style = themestyle
    }
    require('onedark').load()
end
