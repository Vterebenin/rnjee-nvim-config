local builtin = require('telescope.builtin')

local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "Files" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>cs"] = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
  ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<leader>fb"] = { builtin.buffers, "Find Buffer" },
  ["<leader>pr"] = { ":Neotree reveal_file=%:p<CR>", "Reveal File" },
  ["<leader>fg"] = { builtin.live_grep, "Find Grep" },
  ["<leader>fh"] = { builtin.resume, "Find Resume" },
  ["<leader>fr"] = { vim.lsp.buf.format, "Format File" },
  ["<leader>fe"] = { ":EslintFixAll<cr>", "Format File (Eslint)" },
  ["<leader>ls"] = { builtin.spell_suggest, "Spelling" },
})

