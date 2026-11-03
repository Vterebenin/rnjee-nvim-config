local wk = require("which-key")
wk.add({
  { "<leader>p", group = "Project" },
  { "<leader>pv", ":Neotree<CR>", desc = "Project tree" },
  { "<leader>pr", ":Neotree reveal_file=%:p<CR>", desc = "Reveal file" },
  { "<leader>Z", "<cmd>!chmod +x %<CR>", desc = "Make executable", silent = true },
  { "<leader>l", group = "LSP" },
  { "<leader>la", ":lua runCodeAction()<CR>", desc = "Code action" },
  { "<leader>lf", ":lua formatCode()<CR>", desc = "Format" },
  { "<leader>ld", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", desc = "Line diagnostics" },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  { "<leader>ly", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
  { "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
  {
    "<leader>le",
    function()
      if vim.fn.exists(":EslintFixAll") == 2 then
        vim.cmd("EslintFixAll")
      else
        vim.notify("EslintFixAll is not available in this buffer", vim.log.levels.WARN)
      end
    end,
    desc = "Eslint fix",
  },
  { "<leader>u", group = "Utils" },
  { "<leader>uu", vim.cmd.UndotreeToggle, desc = "Undotree" },
  { "<leader>us", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
  { "<leader>ur", [[:%s#\v(\d+)px#\=printf("%0.3frem", 1.0/16*submatch(1))#gc]], desc = "Px to rem" },
})


-- IGNORE
wk.add({
  { "<leader>j", desc = "which_key_ignore" },
  { "<leader>Y", desc = "which_key_ignore" },
  { "<leader>y", desc = "which_key_ignore" },
  { "<leader>k", desc = "which_key_ignore" },
  { "<leader>x", desc = "which_key_ignore" },
})
