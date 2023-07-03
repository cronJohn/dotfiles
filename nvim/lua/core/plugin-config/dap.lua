require("dapui").setup()
local map = require("utils").map

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

map("n", "<Leader>dn", ':DapToggleBreakpoint<CR>')
map("n", "<Leader>dr", ':DapContinue<CR>')
map("n", "<Leader>de", ':DapTerminate<CR>')
map("n", "<Leader>do", ':DapStepOver<CR>')
map("n", "<Leader>ds", ':DapToggleRepl<CR>')

-- Go
map("n", "<Leader>dgn", ":lua require('dap-go').debug_test()<CR>") -- debug closest test above cursor
map("n", "<Leader>dgl", ":lua require('dap-go').debug_last_test()<CR>") -- debug last run test

