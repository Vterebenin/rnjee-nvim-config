local lsp_zero = require('lsp-zero')

require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
  log_level = vim.log.levels.ERROR,
})

require('mason-lspconfig').setup({
  automatic_enable = false,
  ensure_installed = {
    'ts_ls',
    'cssls',
    'html',
    'jsonls',
    'lua_ls',
  },
})

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.config('ts_ls', {
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


vim.lsp.config('cssls', {})
vim.lsp.config('html', {})
vim.lsp.config('jsonls', {})
vim.lsp.config('lua_ls', {})

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
      local menu_icon = {
        nvim_lsp = "NLSP",
        nvim_lua = "NLUA",
        luasnip  = "LSNP",
        buffer   = "BUFF",
        path     = "PATH",
      }
      item.menu = menu_icon[entry.source.name]
      fixed_width = fixed_width or false
      local content = item.abbr
      if fixed_width then
        vim.o.pumwidth = fixed_width
      end
      local win_width = vim.api.nvim_win_get_width(0)
      local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)
      if #content > max_content_width then
        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
      else
        item.abbr = content .. (" "):rep(max_content_width - #content)
      end
      return item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
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

lsp_zero.setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gdscript',
  callback = function()
    local gdscript_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    gdscript_capabilities.textDocument.formatting = false
    gdscript_capabilities.textDocument.rangeFormatting = false

    vim.lsp.start({
      name = 'gdscript',
      cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
      capabilities = gdscript_capabilities,
      on_attach = function(client, bufnr)
        lsp_zero.on_attach(client, bufnr)
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 0
      end,
    })
  end,
})
