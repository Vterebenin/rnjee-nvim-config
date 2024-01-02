local startup = require("startup")
startup.setup {
  theme = "custom_theme",
  content = {
    [" Find File"] = { "Telescope find_files", "<leader>ff" },
    [" Find Word"] = { "Telescope live_grep", "<leader>lg" },
    [" Recent Files"] = { "Telescope oldfiles", "<leader>of" },
    [" File Browser"] = { "Telescope file_browser", "<leader>pv" },
    [" Colorschemes"] = { "Telescope colorscheme", "<leader>cs" },
    [" New File"] = { "lua require'startup'.new_file()", "<leader>nf" },
  }
}


require("startup").setup({theme = "evil"})
