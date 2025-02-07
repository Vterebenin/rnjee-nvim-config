return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',       -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons',   -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    insert_at_start = true,
    --   -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = {
        text = 'undotree',
        align = 'center',   -- *optionally* specify an alignment (either 'left', 'center', or 'right')
      },
      -- Or, specify the event which the sidebar executes when leaving:
      ['neo-tree'] = { event = 'BufWipeout' },
      -- Or, specify all three
      -- Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
    },
    icons = {
      separator = { left = '', right = '' },
      -- If true, add an additional separator at the end of the buffer list
      separator_at_end = false,
    },
  },
  version = '^1.0.0',   -- optional: only update when a new 1.x version is released
}
