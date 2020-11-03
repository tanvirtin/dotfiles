local snap = require('snap')

local vim = vim

local M = {}

M.convert_tabs_to_spaces = function()
    vim.cmd('retab')
end

M.remove_trailing_whitespaces = function()
    vim.cmd([[%s/\s\+$//e]])
end

M.close_all_buffers = function()
    vim.cmd('bufdo bd')
end

M.remove_unwanted_files = function()
    local unwanted_files = { '.DS_Store' }
    for _, unwanted_file in pairs(unwanted_files) do
        vim.cmd('!find . -name "' .. unwanted_file .. '" -delete')
    end
end

M.list_buffers = function()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
        local name = vim.api.nvim_buf_get_name(buf)
        if not name or name == '' then
            vim.api.nvim_buf_delete(buf, {
                force = true,
            })
        end
    end
    vim.cmd('Telescope buffers')
end

M.live_grep = function()
    vim.cmd([[:Telescope live_grep]])
end

M.find_files = function()
    vim.cmd([[:Telescope find_files]])
end

M.help_tags = function()
    vim.cmd([[:Telescope help_tags]])
end

M.git_status = function()
    vim.cmd([[:Telescope git_status]])
end

M.refresh = function()
    vim.cmd('noh')
end

M.save = function()
    vim.cmd('w')
end

M.fix_indent = function()
    vim.api.nvim_input('gg=G')
end

M.set_indent = function(width)
    width = tonumber(width)
    vim.o.tabstop = width
    vim.o.softtabstop = width
    vim.o.shiftwidth = width
    vim.o.expandtab = true
end

M._run_command = function(command, ...)
    local starts_with = command:sub(1, 1)
    if starts_with == '_' or not M[command] or not type(M[command]) == 'function' then
        error('invalid command')
        return
    end
    return M[command](...)
end

return M
