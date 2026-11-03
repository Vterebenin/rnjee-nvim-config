local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    path_display = function(_, path)
      local tail = require("telescope.utils").path_tail(path)
      local display = string.format("%s (%s)", tail, path)
      return display, { { { 0, #tail }, "Constant" } }
    end,
    layout_strategy = "vertical",
    layout_config = { height = 0.95 },
  },
})

local function visual_selection()
  local lines = vim.fn.getregion(vim.fn.getpos("'<"), vim.fn.getpos("'>"), { type = vim.fn.visualmode() })
  return vim.trim(table.concat(lines, " "))
end

local wk = require("which-key")
wk.add({
  { "<leader>f", group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
  { "<leader>fb", builtin.buffers, desc = "Buffers" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New file" },
  { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>fh", builtin.resume, desc = "Resume picker" },
  { "<leader>fg", builtin.live_grep, desc = "Grep project" },

  { "<leader>s", group = "Search" },
  { "<leader>sg", builtin.live_grep, desc = "Grep project" },
  {
    "<leader>sg",
    function() builtin.grep_string({ search = visual_selection() }) end,
    desc = "Grep selection",
    mode = "x",
  },
  { "<leader>sw", builtin.grep_string, desc = "Grep word" },
  { "<leader>sb", builtin.current_buffer_fuzzy_find, desc = "Search buffer" },
  { "<leader>ss", function() require("spectre").toggle() end, desc = "Replace in project" },
  {
    "<leader>ss",
    function() require("spectre").open_visual() end,
    desc = "Replace selection",
    mode = "x",
  },
  {
    "<leader>sf",
    function() require("spectre").open_file_search({ select_word = true }) end,
    desc = "Replace word in file",
  },
  {
    "<leader>sR",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    desc = "Substitute word in buffer",
  },
})
