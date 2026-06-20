vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function()
    vim.cmd("setlocal noexpandtab")
    vim.cmd("setlocal tabstop=4")
    vim.cmd("setlocal shiftwidth=4")
    vim.cmd("setlocal softtabstop=0")
  end,
  group = vim.api.nvim_create_augroup("GDScriptIndentFT", { clear = true }),
})