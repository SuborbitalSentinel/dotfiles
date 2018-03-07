local actions = require "telescope.actions"
local set = vim.keymap.set
local opts = { noremap=true, silent=true }

local function search_vimrc()
   require("telescope.builtin").find_files({
      prompt_title = "< NVIM Config >",
      cwd = "~/.dotfiles/personal/.config/nvim",
   })
end

require('telescope').setup {
   defaults = {
      path_display = {"truncate"},
      mappings = {
         i = {
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-w>"] = actions.send_to_qflist,
         },
         n = {
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-w>"] = actions.send_to_qflist,
         },
      },
   },
}
require('telescope').load_extension('fzf')

set('n', '<c-f>', '<cmd>Telescope find_files<cr>', opts)
set('n', '<c-p>', '<cmd>Telescope git_files<cr>', opts)
set('n', '<c-b>', '<cmd>Telescope buffers<cr>', opts)
set('n', '<c-g>', '<cmd>Telescope live_grep<cr>', opts)
set('n', "<leader>vrc", search_vimrc, opts)
set('n', "<leader>ht", "<cmd>Telescope help_tags<CR>", opts)
