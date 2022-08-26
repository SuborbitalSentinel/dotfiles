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
    use {'folke/tokyonight.nvim'}
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
            vim.g.UltiSnipsEditSplit="vertical"
        end
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require'lualine'.setup {
                options = {
                    theme = 'tokyonight',
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
            local gitsigns = require'gitsigns'
            gitsigns.setup()

            local opts = { noremap=true, silent=true }
            local set = vim.keymap.set
            set('n', '[c', gitsigns.prev_hunk, opts)
            set('n', ']c', gitsigns.next_hunk, opts)

            set('n', '<leader>gs', '<CMD>Git<CR>', opts)
            set('n', '<leader>gl', '<CMD>silent! Gclog<CR><C-L>', opts)
            set('n', '<leader>gb', '<CMD>Git blame<CR>', opts)
            set('n', '<leader>gd', '<CMD>Gdiffsplit<CR>', opts)
            set('n', '<leader>gr', '<CMD>Gread<CR>', opts)
            set('n', '<leader>gw', '<CMD>Gwrite<CR>', opts)
            set('n', '<leader>ge', '<CMD>Gedit<CR>', opts)
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

            local opts = { noremap=true, silent=true }
            local set = vim.keymap.set
            set('n', '<c-f>', '<cmd>Telescope find_files<cr>', opts)
            set('n', '<c-p>', '<cmd>Telescope git_files<cr>', opts)
            set('n', '<c-b>', '<cmd>Telescope buffers<cr>', opts)
            set('n', '<c-g>', '<cmd>Telescope live_grep<cr>', opts)

            local function search_vimrc()
                require("telescope.builtin").find_files({ prompt_title = "< NVIM Config >", cwd = "~/AppData/Local/nvim" })
            end
            set('n', "<leader>vrc", search_vimrc, opts)
            set('n', '<leader>wp', '<cmd>Telescope workspaces<cr>', opts)
            set('n', '<leader>ht', '<cmd>Telescope help_tags<cr>', opts)
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
                    "norg",
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
