local header = {
    [[ ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ]],
    [[ ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ]],
    [[ ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ]],
    [[ ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ]],
    [[ ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ]],
    [[ ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ]],
    [[ ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ]],
    [[ ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ]],
    [[ ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ]],
    [[ ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
    [[ ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ]],
    [[ ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ]],
    [[ ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ]],
    [[ ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ]],
}
local settings = {
  -- every line should be same width without escaped \
  header = {
    type = "text",
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = header,
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  header_2 = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Quote",
    margin = 5,
    content = require("startup.functions").quote(),
    highlight = "Constant",
    default_color = "",
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = "mapping",
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
      { " Find File", "Telescope find_files", "<leader>ff" },
      { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
      { " Recent Files", "Telescope oldfiles", "<leader>of" },
      { " File Browser", "Telescope file_browser", "<leader>fb" },
      { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
      { " New File", "lua require'startup'.new_file()", "<leader>nf" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  clock = {
    type = "text",
    content = function()
      local clock = " " .. os.date("%H:%M")
      local date = " " .. os.date("%d-%m-%y")
      return { clock, date }
    end,
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "",
    margin = 5,
    highlight = "TSString",
    default_color = "#FFFFFF",
    oldfiles_amount = 10,
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = {
    "header",
    "header_2",
    "body",
    "clock",
  },
}
return settings
