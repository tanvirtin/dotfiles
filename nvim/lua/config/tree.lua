local vim = vim

vim.g.nvim_tree_width = 50
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_show_icons = {
    git =  1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
