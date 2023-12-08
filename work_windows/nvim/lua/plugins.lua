return {
    "godlygeek/tabular",
    "tpope/vim-eunuch",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "Hoffs/omnisharp-extended-lsp.nvim",
            "stevearc/conform.nvim",
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim",
        },
    },

    { "kyazdani42/nvim-web-devicons", lazy = true },

    { "aymericbeaumet/vim-symlink", dependencies = { "moll/vim-bbye" } },

    {

        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", "<CMD>Git<CR>", noremap = true, silent = true },
            { "<leader>gl", "<CMD>silent! Gclog<CR><C-L>", noremap = true, silent = true },
            { "<leader>gb", "<CMD>Git blame<CR>", noremap = true, silent = true },
            { "<leader>gd", "<CMD>Gdiffsplit<CR>", noremap = true, silent = true },
            { "<leader>gr", "<CMD>Gread<CR>", noremap = true, silent = true },
            { "<leader>gw", "<CMD>Gwrite<CR>", noremap = true, silent = true },
            { "<leader>ge", "<CMD>Gedit<CR>", noremap = true, silent = true },
        },
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        dependencies = {
            "rose-pine/neovim",
            "codota/tabnine-nvim",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "rose-pine",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                            shortening_target = 70,
                        },
                    },
                    lualine_x = { "tabnine", "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                tabline = {
                    lualine_a = {
                        {
                            "tabs",
                            mode = 1,
                            tabs_color = {
                                active = "lualine_a_normal",
                                inactive = "lualine_c_inactive",
                            },
                        },
                    },
                },
                extensions = {
                    "quickfix",
                    "fugitive",
                },
            })
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local opts = { noremap = true, silent = true }
            local gitsigns = require("gitsigns")

            gitsigns.setup()
            vim.keymap.set("n", "[c", gitsigns.prev_hunk, opts)
            vim.keymap.set("n", "]c", gitsigns.next_hunk, opts)
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "windwp/nvim-autopairs",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "calc" },
                },
            })
        end,
    },

    {
        "stevearc/oil.nvim",
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
            })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                dark_variant = "moon",
            })
            vim.cmd([[ colorscheme rose-pine ]])
        end,
    },

    {
        "codota/tabnine-nvim",
        build = "pwsh.exe -file .\\dl_binaries.ps1",
        config = function()
            require("tabnine").setup({
                disable_auto_comment = true,
                accept_keymap = "<Tab>",
                dismiss_keymap = "<C-]>",
                debounce_ms = 800,
                suggestion_color = { gui = "#808080", cterm = 244 },
                exclude_filetypes = { "TelescopePrompt" },
                log_file_path = nil, -- absolute path to Tabnine log file
            })

            -- tabnine chat maps
            vim.keymap.set("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
            vim.keymap.set("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
            vim.keymap.set("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/playground",
        },
        build = function()
            vim.cmd([[TSUpdate]])
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "c_sharp",
                    "dockerfile",
                    "git_config",
                    "git_rebase",
                    "go",
                    "gomod",
                    "gosum",
                    "gowork",
                    "javascript",
                    "json",
                    "json5",
                    "jsonc",
                    "lua",
                    "python",
                    "sql",
                    "vimdoc",
                    "zig",
                },
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true,
                    disable = { "dockerfile" },
                },
                indent = { enable = true },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope-ui-select.nvim",
            "natecraddock/telescope-zf-native.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local opts = { noremap = true, silent = true }

            local actions = require("telescope.actions")
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            telescope.setup({
                defaults = {
                    layout_strategy = "vertical",
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
                },
            })
            telescope.load_extension("zf-native")
            telescope.load_extension("ui-select")

            local function search_vimrc()
                require("telescope.builtin").find_files({
                    prompt_title = "< NVIM Config >",
                    cwd = "~/AppData/Local/nvim",
                })
            end

            local function search_workflows()
                builtin.live_grep({
                    prompt_title = "< GitHub Workflow Search >",
                    cwd = "/git/JEDIv2/.github",
                })
            end

            vim.keymap.set("n", "<leader>gw", search_workflows, opts)
            vim.keymap.set("n", "<leader>vrc", search_vimrc, opts)
            vim.keymap.set("n", "<c-f>", require("telescope.builtin").find_files, opts)
            vim.keymap.set("n", "<c-p>", require("telescope.builtin").git_files, opts)
            vim.keymap.set("n", "<c-b>", require("telescope.builtin").buffers, opts)
            vim.keymap.set("n", "<c-g>", require("telescope.builtin").live_grep, opts)
            vim.keymap.set("n", "<leader>ht", require("telescope.builtin").help_tags, opts)
        end,
    },
}
