local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gg", ":Neogit<CR>", desc = "Open Neogit" },
  { "<leader>gf", builtin.git_files, desc = "Git files" },
})
