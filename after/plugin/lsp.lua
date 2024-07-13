require 'lspconfig'.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'volar',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    volar = function()
      require('lspconfig').volar.setup({})
    end,
    tsserver = function()
      local vue_typescript_plugin = require('mason-registry')
        .get_package('vue-language-server')
        :get_install_path()
        .. '/node_modules/@vue/language-server'
        .. '/node_modules/@vue/typescript-plugin'

      require('lspconfig').tsserver.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_typescript_plugin,
              languages = {'javascript', 'typescript', 'vue'}
            },
          }
        },
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
    end,
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 35
local MIN_LABEL_WIDTH = 20

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = {
    format = function(entry, vim_item)
      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
      elseif string.len(label) < MIN_LABEL_WIDTH then
        local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
        vim_item.abbr = label .. padding
      end
      return vim_item
    end,
  },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

lsp_zero.setup()

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
