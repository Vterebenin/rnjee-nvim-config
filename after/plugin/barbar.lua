local wk = require("which-key")

wk.add({
  { "<leader>b", name = "buffer" },
  { "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", desc = "order by buffer number" },
  { "<leader>bn", "<Cmd>BufferOrderByName<CR>", desc = "order by name" },
  { "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", desc = "order by directory" },
  { "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", desc = "order by language" },
  { "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", desc = "order by window number" },
  { "<leader>bx", "<Cmd>BufferClose<CR>", desc = "close buffer" },
  { "<leader>be", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "close all but current" },
  { "gt", "<Cmd>BufferNext<CR>", desc = "next buffer" },
  { "gT", "<Cmd>BufferPrevious<CR>", desc = "previous buffer" },
}, { mode = "n", noremap = true, silent = true })
