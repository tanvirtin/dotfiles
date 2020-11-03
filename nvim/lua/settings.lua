local vim = vim

vim.cmd('syntax on')
vim.cmd('colorscheme monokai')
vim.cmd('autocmd TextYankPost * lua vim.highlight.on_yank()')
vim.cmd(string.format(
    'com! -nargs=+ %s',
    'Actions lua require("actions")._run_command(<f-args>)'
))
vim.o.updatetime = 100
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.ttimeoutlen = 0
vim.o.listchars = 'eol:↲,tab:--,extends:…,precedes:…,conceal:┊,nbsp:☠'
vim.o.incsearch = false
vim.o.colorcolumn = '120'
vim.o.clipboard = 'unnamedplus'
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.list = true
vim.wo.wrap = false
