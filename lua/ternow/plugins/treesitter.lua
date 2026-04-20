return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.2",
  build = ":TSUpdate",
  event = "BufRead",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup {
      ensure_installed = { "gdscript", "godot_resource", "javascript", "typescript", "lua", "gdscript" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = false
      }
    }
  end,
}
