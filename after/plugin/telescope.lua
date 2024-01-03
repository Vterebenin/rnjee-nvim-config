local builtin = require('telescope.builtin')

local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "Files" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<leader>fb"] = { builtin.buffers, "Find Buffer" },
  ["<leader>pr"] = { ":Neotree reveal_file=%:p<CR>", "Reveal File" },
  ["<leader>fg"] = { builtin.live_grep, "Find Grep" },
  ["<leader>fr"] = { vim.lsp.buf.format, "Format File" },
  ["<leader>fh"] = { builtin.search_history, "Find History" },
  ["<leader>ls"] = { builtin.spell_suggest, "Spelling" },
})

