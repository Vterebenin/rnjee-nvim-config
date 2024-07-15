local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local wk = require("which-key")
wk.add({
  { "<leader>h", desc = "Harpoon" },
  { "<leader>ha", mark.add_file, desc = "Add file" },
  { "<leader>he", ui.toggle_quick_menu, desc = "Toggle Menu" },
  { "<leader>h1", function() ui.nav_file(1) end, desc = "Navigate to 1" },
  { "<leader>h2", function() ui.nav_file(2) end, desc = "Navigate to 2" },
  { "<leader>h3", function() ui.nav_file(3) end, desc = "Navigate to 3" },
  { "<leader>h4", function() ui.nav_file(4) end, desc = "Navigate to 4" },
})

