local oc = require("ternow.opencode")
local wk = require("which-key")

wk.add({
  { "<leader>o", group = "OpenCode" },
  { "<leader>oo", oc.open, desc = "Open project session" },
  { "<leader>ot", function() oc.task(false) end, desc = "Give it a task" },
  { "<leader>ot", function() oc.task(true) end, desc = "Give it a task on the selection", mode = "x" },
  { "<leader>os", function() require("opencode").select() end, desc = "Delegate a chore", mode = { "n", "x" } },
  { "<leader>oq", function() require("opencode").command("session.interrupt") end, desc = "Stop the current task" },
  { "<leader>oc", oc.close, desc = "Close project session", mode = { "n", "t" } },
})

-- Scroll the session without using Ctrl-Shift-u, which the terminal keeps for Unicode.
local function scroll(command)
  return function()
    require("opencode").command(command)
  end
end

vim.keymap.set({ "n", "t" }, "<A-k>", scroll("session.half.page.up"), { desc = "Scroll session up" })
vim.keymap.set({ "n", "t" }, "<A-j>", scroll("session.half.page.down"), { desc = "Scroll session down" })
