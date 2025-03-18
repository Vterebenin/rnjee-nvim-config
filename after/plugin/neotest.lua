local wk = require("which-key")

require("neotest").setup({
  adapters = {
    require("neotest-vitest"),
    require('rustaceanvim.neotest'),
    require('neotest-jest')({
      jestCommand = "npm run test --",
      env = { CI = true },
      cwd = function(path)
        local root_path = require("lspconfig").util.root_pattern "package.json" (path)
        return root_path or vim.fn.getcwd()
      end,
    }),
  }
})

wk.add({
  { "<leader>t",  name = "Tests" },
  { "<leader>tt", function() require("neotest").run.run() end,                   desc = "Test nearest" },
  { "<leader>tc", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test current file" },
  { "<leader>ts", function() require("neotest").run.stop() end,                  desc = "Test stop" },
  { "<leader>ta", function() require("neotest").run.attach() end,                desc = "Test attach?" },
})
