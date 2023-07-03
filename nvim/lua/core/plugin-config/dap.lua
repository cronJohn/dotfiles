require("dapui").setup()

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

vim.keymap.set("n", "<Leader>dn", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>de", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')

-- Go
vim.keymap.set("n", "<Leader>dgn", ":lua require('dap-go').debug_test()<CR>") -- debug closest test above cursor
vim.keymap.set("n", "<Leader>dgl", ":lua require('dap-go').debug_last_test()<CR>") -- debug last run test

