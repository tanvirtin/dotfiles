local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    local use = use
    use 'hrsh7th/nvim-compe'
    use 'tanvirtin/vgit.nvim'
    use 'nvim-lua/popup.nvim'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'nvim-telescope/telescope.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'glepnir/galaxyline.nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'camspiers/snap'
    use 'folke/tokyonight.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'windwp/nvim-autopairs'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'phaazon/hop.nvim'
    use 'numtostr/FTerm.nvim'
    use 'morhetz/gruvbox'
    use 'kevinhwang91/nvim-bqf'
end)
