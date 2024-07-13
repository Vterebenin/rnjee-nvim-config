local wk = require("which-key")
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    wk.add({
      { "<leader>gs",  gs.stage_hunk, desc = "Stage Hunk" },
      { "<leader>gu",  gs.undo_stage_hunk, desc = "Undo Stage Hunk" },
      { "<leader>gr",  gs.reset_hunk, desc = "Reset Hunk" },
      { "<leader>gR",  gs.reset_buffer, desc = "Reset Buffer" },
      { "<leader>gp",  gs.preview_hunk, desc = "Preview Hunk" },
      { "<leader>gb",  function() gs.blame_line { full = true } end, desc = "Blame Line" },
      { "<leader>gt",  gs.toggle_current_line_blame, desc = "Toggle Blame Line" },
      { "<leader>gS",  gs.stage_buffer, desc = "Stage Buffer" },
      { "<leader>gD",  gs.diffthis, desc = "Diff this" },
      { "<leader>gd",  function() gs.diffthis('~') end, desc = "Diff this ~" },
      { "<leader>gx",  gs.toggle_deleted, desc = "Toggle deleted" },
    })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
