local fn = vim.fn

local function build_telescope_fzf_native()
    local package_path = fn.stdpath('data') .. '/site/pack/paqs/start/telescope-fzf-native.nvim'
    fn.system({'make', '-C', package_path})
end

local function update_telescope()
    vim.cmd[[TSUpdate]]
end

require'paq':setup({verbose = true}) {
    {'savq/paq-nvim'};

    {'hrsh7th/cmp-nvim-lsp'};
    {'hrsh7th/cmp-nvim-lsp-signature-help'};
    {'hrsh7th/cmp-buffer'};
    {'hrsh7th/cmp-nvim-lua'};
    {'hrsh7th/cmp-path'};
    {'hrsh7th/cmp-calc'};
    {'hrsh7th/nvim-cmp'};

    {'neovim/nvim-lspconfig'};
    {'Hoffs/omnisharp-extended-lsp.nvim'};

    {'SirVer/ultisnips'};
    {'aymericbeaumet/vim-symlink'};
    {'folke/tokyonight.nvim'};
    {'godlygeek/tabular'};
    {'hoob3rt/lualine.nvim'};
    {'kyazdani42/nvim-web-devicons'};
    {'lewis6991/gitsigns.nvim'};
    {'natecraddock/workspaces.nvim'};
    {'norcalli/nvim-colorizer.lua'};
    {'nvim-lua/plenary.nvim'};
    {'nvim-lua/popup.nvim'};
    {'nvim-telescope/telescope-fzf-native.nvim', run = build_telescope_fzf_native};
    {'nvim-telescope/telescope.nvim'};
    {'nvim-treesitter/nvim-treesitter', run = update_telescope};
    {'nvim-treesitter/playground'};
    {'tpope/vim-commentary'};
    {'tpope/vim-eunuch'};
    {'tpope/vim-fugitive'};
    {'tpope/vim-repeat'};
    {'tpope/vim-surround'};
    {'tpope/vim-unimpaired'};
    {'tpope/vim-vinegar'};
    {'windwp/nvim-autopairs'};

}
vim.g.AutoPairsUseInsertedCount = 1
vim.g.UltiSnipsEditSplit="vertical"

local opts = { noremap=true, silent=true }
local set = vim.keymap.set

require'plenary.filetype'.add_file('gitattributes')
require'workspaces'.setup()
require'colorizer'.setup()
require'nvim-autopairs'.setup()

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

local gitsigns = require'gitsigns'
gitsigns.setup()
set('n', '[c', gitsigns.prev_hunk, opts)
set('n', ']c', gitsigns.next_hunk, opts)

set('n', '<leader>gs', '<CMD>Git<CR>', opts)
set('n', '<leader>gl', '<CMD>silent! Gclog<CR><C-L>', opts)
set('n', '<leader>gb', '<CMD>Git blame<CR>', opts)
set('n', '<leader>gd', '<CMD>Gdiffsplit<CR>', opts)
set('n', '<leader>gr', '<CMD>Gread<CR>', opts)
set('n', '<leader>gw', '<CMD>Gwrite<CR>', opts)
set('n', '<leader>ge', '<CMD>Gedit<CR>', opts)
