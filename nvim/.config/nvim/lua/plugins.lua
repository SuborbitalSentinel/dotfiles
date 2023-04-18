local fn = vim.fn
local packer_bootstrap = nil
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use {
        'wbthomason/packer.nvim',

        'Decodetalkers/csharpls-extended-lsp.nvim',
        'L3MON4D3/LuaSnip',
        'shaunsingh/nord.nvim',
        'godlygeek/tabular',
        'hoob3rt/lualine.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'j-hui/fidget.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
        'neovim/nvim-lspconfig',
        'norcalli/nvim-colorizer.lua',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-treesitter/playground',
        'tpope/vim-commentary',
        'tpope/vim-eunuch',
        'tpope/vim-fugitive',
        'tpope/vim-repeat',
        'tpope/vim-surround',
        'tpope/vim-unimpaired',
        'tpope/vim-vinegar',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'windwp/nvim-autopairs',
        {
            'neanias/everforest-nvim',
            config = function()
                require("everforest").setup({
                    background = "hard",
                    transparent_background_level = 2,
                    italics = true
                })
            end
        },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 },
        { 'nvim-telescope/telescope.nvim', tag = '0.1.0', },
        { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd [[TSUpdate]] end },
        { 'aymericbeaumet/vim-symlink', requires = { 'moll/vim-bbye' } },
    }

    if packer_bootstrap ~= nil then
        require('packer').sync()
    end
end)
