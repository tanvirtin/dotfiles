local vim = vim
local set_keymap = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true,
}

-- Set leader key
set_keymap('n', '<Space>', '<NOP>', opts)
set_keymap('n', ',', '<NOP>', opts)
vim.g.mapleader = ','

-- Explorer Tree
set_keymap('n', '<Leader><space>', ':NvimTreeToggle<CR>', opts)

-- Better indenting
set_keymap('v', '<', '<gv', opts)
set_keymap('v', '>', '>gv', opts)

-- Move selected line / block of text in visual mode
set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', opts)
set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', opts)

-- Centers the line as you iterate
set_keymap('n', 'n', 'nzzzv', opts)
set_keymap('n', 'N', 'Nzzzv', opts)

-- Shortcuts to save
set_keymap('n', '<leader><leader>', ":lua require('actions').save()<CR>", opts)

-- Toggle window focus
set_keymap('n', '\\', ':winc w<CR>', opts)

-- Delete current buffer
set_keymap('n', '<leader>q', ':bp | sp | bn | bd<CR>', opts)

-- Delete current window
set_keymap('n', '<leader><ESC>', ':q<CR>', opts)
set_keymap('v', '<leader><ESC>', ':q<CR>', opts)

-- Clean up search highlights
set_keymap('n', '<leader>c', ':Actions refresh<CR>', opts)

-- Delete contents without putting the in a register
set_keymap('n', '<leader>d', '"_d', opts)
set_keymap('v', '<leader>d', '"_d', opts)

-- Telescope
set_keymap('n', '<leader>.', ':Actions git_status<CR>', opts)
set_keymap('n', '<leader>h', ':Actions help_tags<CR>', opts)
set_keymap('n', '<leader>l', ':Actions find_files<CR>', opts)
set_keymap('n', '<leader>/', ':Actions live_grep<CR>', opts)
set_keymap('n', '<leader><TAB>', ':Actions list_buffers<CR>', opts)

-- Clipboard
set_keymap('v', '<leader>y', '"+y', opts)
set_keymap('v', '<leader>d', '"+d', opts)
set_keymap('n', '<leader>p', '"+p', opts)
set_keymap('n', '<leader>p', '"+P', opts)
set_keymap('v', '<leader>p', '"+p', opts)
set_keymap('v', '<leader>p', '"+P', opts)

-- Git
set_keymap('n', '<leader>gp', ':VGit hunk_preview<CR>', opts)
set_keymap('n', '<leader>gr', ':VGit hunk_reset<CR>', opts)
set_keymap('n', '<C-k>', ':VGit hunk_up<CR>', opts)
set_keymap('n', '<C-j>', ':VGit hunk_down<CR>', opts)
set_keymap('n', '<leader>gf', ':VGit buffer_preview<CR>', opts)
set_keymap('n', '<leader>gh', ':VGit buffer_history<CR>', opts)
set_keymap('n', '<leader>gu', ':VGit buffer_reset<CR>', opts)
set_keymap('n', '<leader>gd', ':VGit diff<CR>', opts)
set_keymap('n', '<leader>gq', ':VGit hunks_quickfix_list<CR>', opts)

-- Quickfix
set_keymap('n', '<leader>o', ':copen<CR>', opts)
set_keymap('n', '<leader>x', ':ccl<CR>', opts)
set_keymap('n', '<space>j', ':cn<CR>', opts)
set_keymap('n', '<space>k', ':cp<CR>', opts)

-- Buffer navigation
set_keymap('n', '<c-h>', ':bp<CR>', opts)
set_keymap('n', '<c-l>', ':bn<CR>', opts)

-- Terminal
set_keymap('n', '<leader>`', ':lua require("FTerm").toggle()<CR>', opts)
