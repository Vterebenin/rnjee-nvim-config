local wk = require("which-key")
wk.add({
  { "<leader>p",  group = "Project" },
  { "<leader>pv",  ":Neotree<CR>", desc = "Project tree" },
  { "<leader>pr",  ":Neotree reveal_file=%:p<CR>", desc = "Project file" },
  { "<leader>s",  group = "Search" },
  { "<leader>sr",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and Replace" },
  { "<leader>S",  '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
  { "<leader>sw",  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search Current word" },
  { '<leader>sp',  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },
  { "<leader>x",  "<cmd>!chmod +x %<CR>", desc = "Make Executable", silent = true },
  { "<leader>l",  group = "LSP" },
  { "<leader>la",  ":lua runCodeAction()<CR>", desc = "Code Action", noremap = true },
  { "<leader>lf",  ":lua formatCode()<CR>", desc = "Code Format", noremap = true },
  { "<leader>ld",  ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", desc = "Code Diagnostic", noremap = true },
  { "<leader>u",  group = "Utils" },
  { "<leader>uu",  vim.cmd.UndotreeToggle, desc = "Undotree" },
  { "<leader>ur",  [[:%s#\v(\d+)px#\=printf("%0.3frem", 1.0/16*submatch(1))#gc]], desc = "PxToRem" },
})


-- IGNORE
wk.add({
  { "<leader>j", desc = "which_key_ignore" },
  { "<leader>Y", desc = "which_key_ignore" },
  { "<leader>y", desc = "which_key_ignore" },
  { "<leader>k", desc = "which_key_ignore" },
})
