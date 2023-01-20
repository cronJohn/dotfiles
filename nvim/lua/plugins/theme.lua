local user_style = "darker"

return {
    'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup {
            style = user_style,
            transparent = true,
            ending_tildes = true,
        }
        require('onedark').load()
    end
}

