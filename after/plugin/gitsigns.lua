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
    wk.register({
      ["<leader>gs"] = { gs.stage_hunk, "Stage Hunk" },
      ["<leader>gu"] = { gs.undo_stage_hunk, "Undo Stage Hunk" },
      ["<leader>gr"] = { gs.reset_hunk, "Reset Hunk" },
      ["<leader>gR"] = { gs.reset_buffer, "Reset Buffer" },
      ["<leader>gp"] = { gs.preview_hunk, "Preview Hunk" },
      ["<leader>gb"] = { function() gs.blame_line { full = true } end, "Blame Line" },
      ["<leader>gt"] = { gs.toggle_current_line_blame, "Toggle Blame Line" },
      ["<leader>gS"] = { gs.stage_buffer, "Stage Buffer" },
      ["<leader>gD"] = { gs.diffthis, "Diff this" },
      ["<leader>gd"] = { function() gs.diffthis('~') end, "Diff this ~" },
      ["<leader>gx"] = { gs.toggle_deleted, "Toggle deleted" },
    })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
