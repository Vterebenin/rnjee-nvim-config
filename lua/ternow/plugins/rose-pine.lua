return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      highlight_groups = {
        TelescopeResultsTitle = { fg = "surface", bg = "surface" },
        TelescopeBorder = { fg = "surface", bg = "surface" },
        TelescopeSelection = { fg = "text", bg = "overlay", bold = true },
        TelescopeSelectionCaret = { fg = "text", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "love" },
        TelescopePreviewTitle = { fg = "base", bg = "foam" },

        TelescopePromptNormal = { bg = "overlay" },
        TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
        TelescopePromptPrefix = { fg = "love", bg = "overlay" },
        NvimTreeCursorLine = { bg = "surface" },
        NvimTreeNormal = { bg = "#161420" },
        NvimTreeWinSeparator = { bg = "#161420", fg = "#161420" },
        CmpWinBorder = { fg = "overlay", bg = "base" },
      },
    })
  end,
}
