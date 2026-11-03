return {
  "nickjvandyke/opencode.nvim",
  -- Stable tags speak OpenCode v1 (`opencode --port`). `main` targets OpenCode v2.
  version = "*",
  lazy = false,
  config = function()
    local oc = require("ternow.opencode")
    local opts = require("opencode.config").opts
    -- Point every lookup at this project's server. A function cannot live in
    -- vim.g, so it is assigned after the plugin has merged its defaults.
    opts.server.url = function(callback)
      callback(oc.url())
    end
    opts.server.start = function()
      oc.start()
    end
  end,
}
