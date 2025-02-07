require("ternow.setup-lazypath")

local plugins = {}

for _, group in ipairs({
  require("ternow.composers.colorschemes"),
  require("ternow.composers.DX"),
  require("ternow.composers.lsp"),
  require("ternow.composers.debug"),
  require("ternow.composers.tests"),
}) do
  for _, plugin in ipairs(group) do
    table.insert(plugins, plugin)
  end
end

require("lazy").setup(plugins)

