local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'nvim-lua/popup.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'Hoffs/omnisharp-extended-lsp.nvim'}
    use { 'aymericbeaumet/vim-symlink', requires = { 'moll/vim-bbye' } }
    use {'godlygeek/tabular'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'nvim-treesitter/playground'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-eunuch'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-vinegar'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-nvim-lua'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-calc'}
    use {'L3MON4D3/LuaSnip'}

    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup{}
        end
    }

    use {
        'klen/nvim-test',
        config = function()
            require('nvim-test').setup()
        end
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('gruvbox').setup({
                contrast = "hard"
            })
            vim.cmd[[colorscheme gruvbox]]
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            vim.opt.completeopt = "menu,menuone,noselect"
            local cmp = require'cmp'
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
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
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require'lualine'.setup {
                options = {
                    theme = 'gruvbox',
                    section_separators = '',
                    components_separators = '',
                },
                sections  = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                            shortening_target = 70 
                        }
                    },
                    lualine_x = {'diagnostics'},
                    lualine_y = {'encoding', 'fileformat', 'filetype'},
                    lualine_z = {'location'}
                },
                tabline = {
                    lualine_a = {'filename'},
                    lualine_x = {'diff'},
                    lualine_y = {'tabs'},
                }
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                end
            }
        end
    }

    use {
        'natecraddock/workspaces.nvim',
        config = function()
            require'workspaces'.setup()
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            vim.opt.termguicolors = true
            require'colorizer'.setup()
        end
    }

    use {
        'nvim-lua/plenary.nvim',
        config = function()
            require'plenary.filetype'.add_file('gitattributes')
        end
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            local actions = require'telescope.actions'
            require'telescope'.setup {
                defaults = {
                    layout_strategy = 'vertical',
                    path_display = {"truncate"},
                    file_ignore_patterns = { 
                        "%.dll",
                        "%.docx",
                        "%.dwg",
                        "%.dxe",
                        "%.exe",
                        "%.pdf",
                        "%.ttf",
                        "%.xls",
                        "^ExternalAssemblies/",
                        "^tools/"
                    },
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
            require'telescope'.load_extension('fzf')
            require'telescope'.load_extension('workspaces')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() 
            vim.cmd[[TSUpdate]] 
        end,
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "bash",
                    "c_sharp",
                    "comment",
                    "dockerfile",
                    "go",
                    "json5",
                    "lua",
                    "markdown",
                    "python",
                    "regex",
                    "todotxt",
                    "vim",
                    "yaml",
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
            require'nvim-autopairs'.setup()
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
