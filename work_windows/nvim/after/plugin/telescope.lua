local opts = { noremap = true, silent = true }

local actions = require('telescope.actions')
local telescope = require('telescope')
local builtin = require('telescope.builtin')
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

local function search_vimrc()
    require("telescope.builtin").find_files({
        prompt_title = "< NVIM Config >",
        cwd = "~/AppData/Local/nvim",
    })
end

vim.keymap.set('n', '<c-f>', builtin.find_files, opts)
vim.keymap.set('n', '<c-p>', builtin.git_files, opts)
vim.keymap.set('n', '<c-b>', builtin.buffers, opts)
vim.keymap.set('n', '<c-g>', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>ht', builtin.help_tags, opts)
vim.keymap.set('n', "<leader>vrc", search_vimrc, opts)
