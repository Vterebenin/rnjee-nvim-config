local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
  'preservim/nerdtree',
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
    dependencies = { "neo-tree" }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      vim.cmd('colorscheme rose-pine')
    end
  },
  { "nvim-treesitter/nvim-treesitter", },
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  { 'williamboman/mason.nvim' },
  { 'dundalek/lazy-lsp.nvim', dependencies = { 'neovim/nvim-lspconfig' } },
  'nvim-lua/plenary.nvim',
  'tjdevries/express_line.nvim',
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  'sbdchd/neoformat',
  'stevearc/dressing.nvim',
  'lommix/godot.nvim',
  'mfussenegger/nvim-dap',
  -- lsp
  -- 
  'simrat39/rust-tools.nvim',
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  { 'hrsh7th/nvim-cmp' },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  }
})

require("mason").setup()
