local set = vim.keymap.set
local opts = { noremap = true, silent = true }

local function build_telescope_fzf_native()
    local package_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/telescope-fzf-native.nvim'
    vim.fn.system({ 'make', '-C', package_path })
end

local function update_telescope()
    vim.cmd [[TSUpdate]]
end

require 'paq' {
    { 'savq/paq-nvim' };

    { 'hrsh7th/cmp-nvim-lsp' };
    { 'hrsh7th/cmp-nvim-lsp-signature-help' };
    { 'hrsh7th/cmp-buffer' };
    { 'hrsh7th/cmp-path' };
    { 'hrsh7th/cmp-nvim-lua' };
    { 'hrsh7th/cmp-calc' };
    { 'hrsh7th/nvim-cmp' };

    { 'Hoffs/omnisharp-extended-lsp.nvim' };
    { 'jose-elias-alvarez/null-ls.nvim' };
    { 'neovim/nvim-lspconfig' };

    { 'SirVer/ultisnips' };
    { 'aymericbeaumet/vim-symlink' };
    { 'folke/tokyonight.nvim' };
    { 'godlygeek/tabular' };
    { 'hoob3rt/lualine.nvim' };
    { 'kyazdani42/nvim-web-devicons' };
    { 'lewis6991/gitsigns.nvim' };
    { 'norcalli/nvim-colorizer.lua' };
    { 'nvim-lua/plenary.nvim' };
    { 'nvim-lua/popup.nvim' };
    { 'nvim-telescope/telescope-fzf-native.nvim', run = build_telescope_fzf_native };
    { 'nvim-telescope/telescope.nvim' };
    { 'nvim-treesitter/nvim-treesitter', run = update_telescope };
    { 'nvim-treesitter/playground' };
    { 'tpope/vim-commentary' };
    { 'tpope/vim-eunuch' };
    { 'tpope/vim-fugitive' };
    { 'tpope/vim-repeat' };
    { 'tpope/vim-surround' };
    { 'tpope/vim-unimpaired' };
    { 'tpope/vim-vinegar' };
    { 'windwp/nvim-autopairs' };

}

vim.g.AutoPairsUseInsertedCount = 1
vim.g.UltiSnipsEditSplit = "vertical"
vim.opt.termguicolors = true -- Required to be set before colorizer.nvim's setup

local gitsigns = require 'gitsigns'
gitsigns.setup()
set('n', '[c', gitsigns.prev_hunk, opts)
set('n', ']c', gitsigns.next_hunk, opts)

require 'load_plugins.cmp_config'
require 'load_plugins.treesitter_config'
require 'load_plugins.lualine_config'
require 'load_plugins.telescope_config'
require 'load_plugins.fugitive_config'
require 'load_plugins.null-ls_config'
require 'colorizer'.setup()
require 'nvim-autopairs'.setup()
