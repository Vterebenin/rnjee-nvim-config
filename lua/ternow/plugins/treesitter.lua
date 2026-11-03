return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  config = function()
    -- Pinned to v0.9.2, which configures modules through nvim-treesitter.configs.
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "gdscript",
        "godot_resource",
        "javascript",
        "typescript",
        "lua",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- v0.9.2's gdscript query still captures `(underscore)`. The installed
    -- parser names that node `_pattern`, so the highlight query fails to parse.
    local files = vim.api.nvim_get_runtime_file("queries/gdscript/highlights.scm", true)
    if #files > 0 then
      local chunks = {}
      for _, path in ipairs(files) do
        table.insert(chunks, table.concat(vim.fn.readfile(path), "\n"))
      end
      vim.treesitter.query.set(
        "gdscript",
        "highlights",
        table.concat(chunks, "\n"):gsub("%(underscore%)", "(_pattern)")
      )
    end
  end,
}
