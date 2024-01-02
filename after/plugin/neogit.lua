local wk = require("which-key")
wk.register({
  ["<leader>g"] = { name = "Neogit" },
  ["<leader>gg"] = { ":Neogit<CR>", "Open Neogit" },
})
