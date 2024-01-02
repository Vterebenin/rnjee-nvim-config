local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local wk = require("which-key")
wk.register({
  ["<leader>h"] = { name = "Harpoon" },
  ["<leader>ha"] = { mark.add_file, "Add file" },
  ["<leader>he"] = { ui.toggle_quick_menu, "Toggle Menu" },
  ["<leader>h1"] = { function() ui.nav_file(1) end, "Navigate to 1" },
  ["<leader>h2"] = { function() ui.nav_file(2) end, "Navigate to 2" },
  ["<leader>h3"] = { function() ui.nav_file(3) end, "Navigate to 3" },
  ["<leader>h4"] = { function() ui.nav_file(4) end, "Navigate to 4" },
})
