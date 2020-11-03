local vim = vim

local function on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local function setup_servers()
    require 'lspinstall'.setup()

    local lspconf = require('lspconfig')
    local servers = require 'lspinstall'.installed_servers()

    for _, lang in pairs(servers) do
        if lang ~= 'lua' then
            lspconf[lang].setup {
                on_attach = on_attach,
                root_dir = vim.loop.cwd
            }
        elseif lang == 'lua' then
            lspconf[lang].setup {
                root_dir = function()
                    return vim.loop.cwd()
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                            }
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            }
        end
    end
end

setup_servers()

require 'lspinstall'.post_install_hook = function()
    setup_servers()
    vim.cmd('bufdo e')
end

vim.fn.sign_define('LspDiagnosticsSignError', {text = '', numhl = 'LspDiagnosticsDefaultError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'LspDiagnosticsDefaultWarning'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'LspDiagnosticsDefaultInformation'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'LspDiagnosticsDefaultHint'})
