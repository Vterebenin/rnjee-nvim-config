local builtin = require('telescope.builtin')

local wk = require("which-key")
wk.add({
  { "<leader>f", group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>cs", "<cmd>Telescope colorscheme<cr>", desc = "Change colorscheme" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
  { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
  { "<leader>pr", ":Neotree reveal_file=%:p<CR>", desc = "Reveal File" },
  { "<leader>fg", builtin.live_grep, desc = "Find Grep" },
  { "<leader>fh", builtin.resume, desc = "Find Resume" },
  { "<leader>fr", vim.lsp.buf.format, desc = "Format File" },
  { "<leader>fe", ":EslintFixAll<cr>", desc = "Format File (Eslint)" },
  { "<leader>ls", builtin.spell_suggest, desc = "Spelling" },
})

