return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  config = function()
    require("nvim-treesitter").setup {}
    require("nvim-treesitter").install {
      "gdscript",
      "godot_resource",
      "javascript",
      "typescript",
      "lua",
    }
  end,
}
