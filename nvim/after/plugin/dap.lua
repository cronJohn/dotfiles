require("dapui").setup()

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "Error" })

local map = require("keytex.keybindings").create_keybinding

local dap, dapui = require("dap"), require("dapui")

-- Zig
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
      command = "codelldb",
      args = { "--port", "${port}" },
  },
}

dap.configurations.zig = {
  {
      name = 'Launch',
      type = 'codelldb',
      request = 'launch',
      program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

map("n", "<Leader>es", ":DapToggleBreakpoint<CR>", {desc = "Toggle Dap breakpoint"})
map("n", "<Leader>et", ":DapContinue<CR>", {desc = "Continue Dap to next stop"})
map("n", "<Leader>ea", ":DapTerminate<CR>", {desc = "Terminate/End Dap session"})
map("n", "<Leader>eo", ":DapStepOver<CR>", {desc = "Dap step over"})
map("n", "<Leader>er", ":DapToggleRepl<CR>", {desc = "Dap toggle repl"})

-- Go
map("n", "<Leader>en", ":lua require('dap-go').debug_test()<CR>", {desc = "Dap debug closest test above cursor"})
map("n", "<Leader>ep", ":lua require('dap-go').debug_last_test()<CR>", {desc = "Dap debug last run test"})
