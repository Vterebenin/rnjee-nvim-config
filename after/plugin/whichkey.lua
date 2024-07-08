local wk = require("which-key")
wk.register({
  ["<leader>p"] = { name = "Project" },
  ["<leader>pv"] = { ":Neotree<CR>", "Project tree" },
  ["<leader>pr"] = { ":Neotree reveal_file=%:p<CR>", "Project file" },
  ["<leader>s"] = { name = "Search" },
  ["<leader>sr"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and Replace" },
  ["<leader>S"] = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre" },
  ["<leader>sw"] = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search Current word" },
  ['<leader>sp'] = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file" },
  ["<leader>x"] = { "<cmd>!chmod +x %<CR>", "Make Executable", silent = true },
  ["<leader>l"] = { name = "LSP" },
  ["<leader>la"] = { ":lua runCodeAction()<CR>", "Code Action", noremap = true },
  ["<leader>lf"] = { ":lua formatCode()<CR>", "Code Format", noremap = true },
  ["<leader>ld"] = { ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", "Code Diagnostic", noremap = true },
  ["<leader>u"] = { name = "Utils" },
  ["<leader>uu"] = { vim.cmd.UndotreeToggle, "Undotree" },
  ["<leader>ur"] = { [[:%s#\v(\d+)px#\=printf("%0.3frem", 1.0/16*submatch(1))#gc]], "PxToRem" },
})


-- IGNORE
wk.register({
  ["<leader>j"] = "which_key_ignore",
  ["<leader>Y"] = "which_key_ignore",
  ["<leader>y"] = "which_key_ignore",
  ["<leader>k"] = "which_key_ignore",
})
