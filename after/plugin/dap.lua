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

local wk = require("which-key")
wk.register({
  ["<leader>d"] = { name = "Debug" },
  ["<leader>dt"] = { ":DapToggleBreakpoint<CR>", "Toggle breakpoint" },
  ["<leader>dx"] = { ":DapTerminate<CR>", "Toggle Terminate" },
  ["<leader>do"] = { ":DapStepOver<CR>", "Step Over" },
  ["<leader>du"] = { ":DapStepOut<CR>", "Step Out" },
})

