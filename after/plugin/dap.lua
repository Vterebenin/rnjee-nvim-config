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

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}


local wk = require("which-key")
wk.add({
  { "<leader>d", group = "Debug" },
  { "<leader>dt", ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
  { "<leader>dx", ":DapTerminate<CR>", desc = "Toggle Terminate" },
  { "<leader>do", ":DapStepOver<CR>", desc = "Step Over" },
  { "<leader>du", ":DapStepOut<CR>", desc = "Step Out" },
})

