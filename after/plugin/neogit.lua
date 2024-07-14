local builtin = require('telescope.builtin')
local wk = require("which-key")
local neogit = require("neogit")

wk.add({
  { "<leader>g", group = "Neogit" },
  { "<leader>gg", neogit.open(), desc = "Open Neogit" },
  { "<leader>gf", builtin.git_files, desc = "Git files" },
})
