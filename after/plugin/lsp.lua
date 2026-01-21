local lspconfig = require('lspconfig')
lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}
local lsp_zero = require('lsp-zero')

require('mason').setup({})

-- Skip mason-lspconfig setup due to compatibility issue with Neovim 0.10
-- Configure LSP servers directly instead
lspconfig.volar.setup {}

-- Simplified ts_ls setup without vue typescript plugin to avoid registry issues
lspconfig.ts_ls.setup({
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = {
    expandable_indicator = true,
    fields = { "abbr", "menu", "kind" },
    format = function(entry, item)
      -- Define menu shorthand for different completion sources.
      local menu_icon = {
        nvim_lsp = "NLSP",
        nvim_lua = "NLUA",
        luasnip  = "LSNP",
        buffer   = "BUFF",
        path     = "PATH",
      }
      -- Set the menu "icon" to the shorthand for each completion source.
      item.menu = menu_icon[entry.source.name]

      -- Set the fixed width of the completion menu to 60 characters.
      -- fixed_width = 20

      -- Set 'fixed_width' to false if not provided.
      fixed_width = fixed_width or false

      -- Get the completion entry text shown in the completion window.
      local content = item.abbr

      -- Set the fixed completion window width.
      if fixed_width then
        vim.o.pumwidth = fixed_width
      end

      -- Get the width of the current window.
      local win_width = vim.api.nvim_win_get_width(0)

      -- Set the max content width based on either: 'fixed_width'
      -- or a percentage of the window width, in this case 20%.
      -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
      local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

      -- Truncate the completion entry text if it's longer than the
      -- max content width. We subtract 3 from the max content width
      -- to account for the "..." that will be appended to it.
      if #content > max_content_width then
        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
      else
        item.abbr = content .. (" "):rep(max_content_width - #content)
      end
      return item
    end,
  },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

local wk = require("which-key")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
  wk.add({
    { "gR", ":Telescope lsp_references<CR>", desc = "References Search" }
  })
end)

-- Setup lsp-zero after configuring servers
lsp_zero.setup()


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }
-- lspconfig.cssls.setup {
--   capabilities = capabilities,
-- }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
-- Disable formatting capabilities for GDScript to prevent LSP from overriding tab settings
local gdscript_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
gdscript_capabilities.textDocument.formatting = false
gdscript_capabilities.textDocument.rangeFormatting = false

require("lspconfig")["gdscript"].setup({
    name = "godot",
    cmd = vim.lsp.rpc.connect("127.0.0.1", "6005"),
    capabilities = gdscript_capabilities,
    on_attach = function(client, bufnr)
      -- Call the default on_attach function first
      lsp_zero.on_attach(client, bufnr)

      -- Ensure GDScript-specific settings are preserved after LSP attaches
      vim.opt_local.expandtab = false
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
    end,
  })
