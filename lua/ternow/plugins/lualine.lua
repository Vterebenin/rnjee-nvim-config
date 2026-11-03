return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'nickjvandyke/opencode.nvim' },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          require("opencode").statusline,
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
