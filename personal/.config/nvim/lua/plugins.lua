local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'L3MON4D3/LuaSnip'
    use 'godlygeek/tabular'
    use 'kyazdani42/nvim-web-devicons'

    use {
        'tpope/vim-commentary',
        'tpope/vim-eunuch',
        'tpope/vim-fugitive',
        'tpope/vim-repeat',
        'tpope/vim-surround',
        'tpope/vim-unimpaired',
        'tpope/vim-vinegar',
    }

    use {
        {
            'williamboman/mason.nvim',
            config = function()
                require('mason').setup()
            end
        },
        {
            'williamboman/mason-lspconfig.nvim',
            config = function()
                require('mason-lspconfig').setup({
                    ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "omnisharp" }
                })
            end
        },
        'Hoffs/omnisharp-extended-lsp.nvim',
        'neovim/nvim-lspconfig',
    }

    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {}
        end
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('gruvbox').setup({})
            vim.cmd [[colorscheme gruvbox]]
        end
    }

    use {
        'aymericbeaumet/vim-symlink',
        requires = { 'moll/vim-bbye' }
    }

    use {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        {
            'hrsh7th/nvim-cmp',
            config = function()
                vim.opt.completeopt = "menu,menuone,noselect"
                local cmp = require('cmp')
                local cmp_autopairs = require('nvim-autopairs.completion.cmp')
                cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
                cmp.setup {
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-y'] = cmp.mapping.confirm({ select = true })
                    }),
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'nvim_lsp_signature_help' },
                        { name = 'buffer' },
                        { name = 'nvim_lua' },
                        { name = 'path' },
                        { name = 'calc' },
                    }
                }
            end
        },
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options  = {
                    theme = 'gruvbox',
                    section_separators = '',
                    components_separators = '',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                            shortening_target = 70
                        }
                    },
                    lualine_x = { 'diagnostics' },
                    lualine_y = { 'encoding', 'fileformat', 'filetype' },
                    lualine_z = { 'location' }
                },
                tabline  = {
                    lualine_a = { 'filename' },
                    lualine_x = { 'diff' },
                    lualine_y = { 'tabs' },
                }
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            vim.opt.termguicolors = true
            require('colorizer').setup()
        end
    }

    use {
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local actions = require('telescope.actions')
            local telescope = require('telescope')
            telescope.setup {
                defaults = {
                    layout_strategy = 'vertical',
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<C-q>"] = actions.send_selected_to_qflist,
                            ["<C-w>"] = actions.send_to_qflist,
                            ["<C-d>"] = actions.delete_buffer,
                        },
                        n = {
                            ["<C-q>"] = actions.send_selected_to_qflist,
                            ["<C-w>"] = actions.send_to_qflist,
                            ["<C-d>"] = actions.delete_buffer,
                        },
                    },
                }
            }
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')
        end
    }

    use {
        'nvim-treesitter/playground',
        {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                vim.cmd [[TSUpdate]]
            end,
            config = function()
                require('nvim-treesitter.configs').setup {
                    ensure_installed = "all",
                    highlight = { enable = true, },
                    indent = { enable = true }
                }
            end
        },
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    if packer_bootstrap ~= nil then
        require('packer').sync()
    end
end)
