local opts = { noremap = true, silent = true }
local set = vim.keymap.set

local function search_vimrc()
    require("telescope.builtin").find_files({
        prompt_title = "< NVIM Config >",
        cwd = "~/.dotfiles/personal/.config/nvim",
    })
end

set('n', '<leader>gs', '<CMD>Git<CR>', opts)
set('n', '<leader>gl', '<CMD>silent! Gclog<CR><C-L>', opts)
set('n', '<leader>gb', '<CMD>Git blame<CR>', opts)
set('n', '<leader>gd', '<CMD>Gdiffsplit<CR>', opts)
set('n', '<leader>gr', '<CMD>Gread<CR>', opts)
set('n', '<leader>gw', '<CMD>Gwrite<CR>', opts)
set('n', '<leader>ge', '<CMD>Gedit<CR>', opts)

set('n', '[c', require('gitsigns').prev_hunk, opts)
set('n', ']c', require('gitsigns').next_hunk, opts)

set('n', '<c-f>', '<cmd>Telescope find_files<cr>', opts)
set('n', '<c-p>', '<cmd>Telescope git_files<cr>', opts)
set('n', '<c-b>', '<cmd>Telescope buffers<cr>', opts)
set('n', '<c-g>', '<cmd>Telescope live_grep<cr>', opts)
set('n', '<leader>wp', '<cmd>Telescope workspaces<cr>', opts)
set('n', '<leader>ht', '<cmd>Telescope help_tags<cr>', opts)
set('n', "<leader>vrc", search_vimrc, opts)

set('n', '<leader>tr', ':write | edit | TSBufEnable highlight<CR>', opts)
set('v', '<leader>y', '"+y', opts)
set('', '<leader>p', '"+p', opts)
