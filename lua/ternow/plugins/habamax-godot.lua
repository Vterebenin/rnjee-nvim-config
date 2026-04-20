return {
  'Mathijs-Bakker/godotdev.nvim',
  dependencies = { 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
  config = function()
    require('godotdev').setup()
  end,
}
