local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")


dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

dashboard.section.buttons.val = {
    dashboard.button( "a", "🆕 > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "r", "🔍 > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "s", "🕒 > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "o", "📁 > Projects"   , ":Telescope projects<CR>"),
    dashboard.button( "t", "🚪 > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = "Welcome!"

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
