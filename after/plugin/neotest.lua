local wk = require("which-key")

require("neotest").setup({
  adapters = {
    require("neotest-vitest"),
    require('rustaceanvim.neotest'),
  }
})

wk.register({
  ["<leader>t"] = { name = "Tests" },
  ["<leader>tt"] = { function() require("neotest").run.run() end, "Test nearest" },
  ["<leader>tc"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Test current file" },
  ["<leader>ts"] = { function() require("neotest").run.stop() end, "Test stop" },
  ["<leader>ta"] = { function() require("neotest").run.attach() end, "Test attach?" },
})

