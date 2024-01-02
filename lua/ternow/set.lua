vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'silent! Neoformat',
  group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
})

function Open_plugin()
    local cmd_args = vim.fn.argc()
    if cmd_args > 0 then
        vim.cmd('Neotree')
    end
end

-- Automatically call the function on VimEnter
vim.cmd('autocmd VimEnter * lua Open_plugin()')
