local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'Hoffs/omnisharp-extended-lsp.nvim'
    use 'godlygeek/tabular'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'kyazdani42/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/popup.nvim'
    use 'nvim-treesitter/playground'
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-vinegar'

    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup{}
        end
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('gruvbox').setup({
                transparent_mode = true
            })
            vim.cmd[[colorscheme gruvbox]]
        end
    }

    use {
        'aymericbeaumet/vim-symlink',
        requires = { 'moll/vim-bbye' }
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require('null-ls')

            local sources = {
                null_ls.builtins.formatting.black
            }

            null_ls.setup({ sources = sources })
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            vim.opt.completeopt = "menu,menuone,noselect"
            local cmp = require('cmp')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
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
    }

    use {
        'SirVer/ultisnips',
        config = function()
            vim.g.UltiSnipsEditSplit = "vertical"
        end
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
        'natecraddock/workspaces.nvim',
        config = function()
            require('workspaces').setup()
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
        'nvim-lua/plenary.nvim',
        config = function()
            require('plenary.filetype').add_file('gitattributes')
        end
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
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
            telescope.load_extension('workspaces')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd [[TSUpdate]]
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "bash",
                    "c_sharp",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "fish",
                    "go",
                    "haskell",
                    "html",
                    "http",
                    "javascript",
                    "json5",
                    "latex",
                    "llvm",
                    "lua",
                    "make",
                    "norg",
                    "python",
                    "regex",
                    "rust",
                    "solidity",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vue",
                    "yaml",
                    "zig",
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                }
            }
        end
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
