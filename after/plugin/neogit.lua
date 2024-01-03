local builtin = require('telescope.builtin')
local wk = require("which-key")
wk.register({
  ["<leader>g"] = { name = "Neogit" },
  ["<leader>gg"] = { ":Neogit<CR>", "Open Neogit" },
  ["<leader>gf"] = { builtin.git_files, "Git files" },
  ["<leader>gb"] = { builtin.git_branches, "Git branches" },
})
