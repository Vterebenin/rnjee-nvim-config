return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "rouge8/neotest-rust",
    'nvim-neotest/neotest-jest',
  },
  adapters = {
    "neotest-rust",
    "neotest-jest"
  },
}
