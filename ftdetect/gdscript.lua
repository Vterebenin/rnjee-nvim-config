-- File type detection for GDScript files
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.gd" },
  command = "setfiletype gdscript",
  group = vim.api.nvim_create_augroup('GDScriptFileType', { clear = true }),
})